import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:meta/meta.dart';
import 'package:over_react/src/component_declaration/annotations.dart' as annotations;
import 'package:over_react/src/util/pretty_print.dart';
import 'package:over_react/src/util/string_util.dart';
import 'package:transformer_utils/transformer_utils.dart';

import '../../util.dart';
import 'ast_util.dart';
import 'util.dart';
import 'validation.dart';
import 'version.dart';

part 'members/component.dart';
part 'members/factory.dart';
part 'members/props_and_state.dart';

abstract class BoilerplateMember {
  final int declarationConfidence;

  BoilerplateMember(this.declarationConfidence);

  CompilationUnitMember get node;

  /// The confidence that, assuming that [node] has been correctly identified as this type of boilerplate member,
  /// it belongs to a boilerplate declaration of a given version.
  Map<BoilerplateVersion, int> get versionConfidence;

  void validate(BoilerplateVersion version, ValidationErrorCollector errorCollector);

  SimpleIdentifier get name;

  @override
  String toString() => '${super.toString()} (${name.name}) ${prettyPrintMap(versionConfidence)}';

  String get debugString {
    final confidence = versionConfidence;
    final sortedKeys = BoilerplateVersion.values.where(confidence.containsKey);
    final shorthandConfidence = {
      for (var key in sortedKeys) '${key.toString().split('.').last}': confidence[key],
    };

    return '${runtimeType.toString()}; confidence:$shorthandConfidence';
  }
}

class BoilerplateMembers {
  final factories = <BoilerplateFactory>[];
  final props = <BoilerplateProps>[];
  final propsMixins = <BoilerplatePropsMixin>[];
  final components = <BoilerplateComponent>[];
  final states = <BoilerplateState>[];
  final stateMixins = <BoilerplateStateMixin>[];

  Iterable<BoilerplateMember> get allMembers => allMembersLists.expand((i) => i);
  List<List<BoilerplateMember>> get allMembersLists => [
    factories,
    props,
    propsMixins,
    components,
    states,
    stateMixins,
  ];

  bool get isEmpty => allMembersLists.every((list) => list.isEmpty);
  bool get isNotEmpty => !isEmpty;

  BoilerplateMembers.detect(CompilationUnit unit) {
    final visitor = BoilerplateMemberDetector()..members = this;
    unit.accept(visitor);
  }

  toString() => 'BoilerplateMembers:${prettyPrintMap({
    'factories': factories,
    'props': props,
    'propsMixins': propsMixins,
    'components': components,
    'states': states,
    'stateMixins': stateMixins,
  }..removeWhere((_, value) => value.isEmpty))}';
}

class BoilerplateMemberDetector extends SimpleAstVisitor<void> {
  BoilerplateMembers members;
  Map<String, NamedCompilationUnitMember> classishDeclarationsByName = {};

  @override
  visitCompilationUnit(CompilationUnit node) {
    node.visitChildren(this);
    classishDeclarationsByName.values.forEach(processClassishDeclaration);
  }

  @override
  visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    if (node.hasAnnotationWithName('Factory')) {
      members.factories.add(BoilerplateFactory(node, Confidence.high));
      return;
    }

    final type = node.variables.type;
    if (type != null) {
      if (type?.typeNameWithoutPrefix == 'UiFactory') {
        final firstVar = node.variables.variables.first;
        final name = firstVar.name.name;
        final identifierInInitializer = firstVar.initializer?.tryCast<Identifier>()?.nameWithoutPrefix;
        // Check for `Foo = _$Foo` or `Foo = $Foo` (which could be a typo)
        if (identifierInInitializer != null && (identifierInInitializer == '_\$$name' || identifierInInitializer == '\$$name')) {
          members.factories.add(BoilerplateFactory(node, Confidence.high));
        } else {
          members.factories.add(BoilerplateFactory(node, Confidence.medium));
        }
      }
    } else {
      // todo do we need something with function components?
//      if ((node.variables.firstInitializer?.tryCast<MethodInvocation>()?.methodName?.name == 'uiFunction') {
//        factories.add(BoilerplateFactory(node));
//      }
    }
  }

  /// For `FooProps`, returns `_$FooProps`
  NamedCompilationUnitMember getSourceClassForPotentialCompanion(NamedCompilationUnitMember node) {
    final name = node.name.name;
    if (name.startsWith(privateSourcePrefix)) {
      return null;
    }
    final sourceName = '$privateSourcePrefix$name';
    return classishDeclarationsByName[sourceName];
  }

  /// For `_$FooProps`, returns `FooProps`
  NamedCompilationUnitMember getCompanionClass(NamedCompilationUnitMember node) {
    final name = node.name.name;
    if (!name.startsWith(privateSourcePrefix)) {
      return null;
    }
    final sourceName = name.replaceFirst(privateSourcePrefix, '');
    return classishDeclarationsByName[sourceName];
  }

  /// Returns whether it's the `$FooPropsMixin` to a `_$FooPropsMixin`
  bool isMixinStub(NamedCompilationUnitMember node) {
    final name = node.name.name;
    return name.startsWith(r'$') && classishDeclarationsByName.containsKey('_$name');
  }

  void processClassishDeclaration(NamedCompilationUnitMember node) {
    // If this is a companion class, ignore it.
    final sourceClass = getSourceClassForPotentialCompanion(node);
    if (sourceClass != null) return;

    if (isMixinStub(node)) return;

    final classish = node.asClassish();
    final companion = getCompanionClass(node)?.asClassish();

    if (_detectBasedOnAnnotations(classish, companion: companion)) return;
    if (_detectPropsStateAndMixins(classish, companion: companion)) return;
    if (_detectComponent(classish)) return;
  }

  bool _detectBasedOnAnnotations(ClassishDeclaration classish, {ClassishDeclaration companion}) {
    for (final annotation in classish.metadata) {
      switch (annotation.name.nameWithoutPrefix) {
        case 'Props':
        case 'AbstractProps':
          members.props.add(BoilerplateProps(classish, Confidence.high, companion: companion));
          return true;
        case 'PropsMixin':
          members.propsMixins.add(BoilerplatePropsMixin(classish.node, Confidence.high, companion: companion));
          return true;
        case 'State':
        case 'AbstractState':
          members.states.add(BoilerplateState(classish, Confidence.high, companion: companion));
          return true;
        case 'StateMixin':
          members.stateMixins.add(BoilerplateStateMixin(classish.node, Confidence.high, companion: companion));
          return true;
        case 'Component':
        case 'Component2':
        case 'AbstractComponent':
        case 'AbstractComponent2':
          members.components.add(BoilerplateComponent(classish, Confidence.high));
          return true;
      }
    }

    return false;
  }

  bool _detectPropsStateAndMixins(ClassishDeclaration classish, {ClassishDeclaration companion}) {
    final name = classish.name.name;
    final node = classish.node;

    var looksLikeMixin = false;
    if (node is MixinDeclaration) {
      looksLikeMixin = true;
    } else if (classish.hasAbstractKeyword && classish.mixins.isEmpty) {
      final superclassName = classish.superclass?.nameWithoutPrefix;
      if (superclassName == null || superclassName == 'Object') {
        looksLikeMixin = true;
      }
    }

    // Prioritize categorize PropsMixins before Props // todo better comment
    if (looksLikeMixin) {
      if (name.endsWith('Props') || name.endsWith('PropsMixin')) {
        members.propsMixins.add(BoilerplatePropsMixin(node, Confidence.medium, companion: companion));
        return true;
      }
      if (name.endsWith('State') || name.endsWith('StateMixin')) {
        members.stateMixins.add(BoilerplateStateMixin(node, Confidence.medium, companion: companion));
        return true;
      }
    } else {
      // todo start looking for other characteristics (superclasses, etc).
      // how to not get false positives for stuff that doesn't want codegen?
      if (name.endsWith('Props') || name.endsWith('PropsMapView')) {
        members.props.add(BoilerplateProps(classish, Confidence.medium, companion: companion));
        return true;
      }
      if (name.endsWith('State')) {
        members.states.add(BoilerplateState(classish, Confidence.medium, companion: companion));
        return true;
      }
    }

    return false;
  }

  bool _detectComponent(ClassishDeclaration classish) {
    // todo optimize
    final allSuperTypes = [
      ...classish.interfaces,
      ...classish.mixins,
      if (classish.superclass != null) classish.superclass,
    ];

    // Don't detect react-dart components as boilerplate components, since they cause issues with grouping
    // if they're in the same file as an OverReact component with non-matching names.
    if (!const {'Component', 'Component2'}.contains(classish.superclass?.nameWithoutPrefix)) {
      int confidence = 0;
      if (classish.name.name.endsWith('Component')) {
        confidence += Confidence.medium;
      }
      if (allSuperTypes.any((type) {
        final name = type.nameWithoutPrefix;
        return name == 'UiComponent' || name == 'UiComponent2';
      })) {
        confidence += Confidence.high;
      }
      // extending from an abstract component: `FooComponent extends BarComponent<FooProps, FooState>`
      if (classish.superclass?.typeArguments?.arguments?.any((arg) => arg.typeNameWithoutPrefix.contains('Props')) ?? false) {
        confidence += Confidence.medium;
      }

      if (confidence != 0) {
        members.components.add(BoilerplateComponent(classish, confidence));
        return true;
      }
    }

    return false;
  }

  void visitClassishDeclaration(NamedCompilationUnitMember node) {
    classishDeclarationsByName[node.name.name] = node;
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) => visitClassishDeclaration(node);

  @override
  void visitClassTypeAlias(ClassTypeAlias node) => visitClassishDeclaration(node);

  @override
  void visitMixinDeclaration(MixinDeclaration node) => visitClassishDeclaration(node);
}
