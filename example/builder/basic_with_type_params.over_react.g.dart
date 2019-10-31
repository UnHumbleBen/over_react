// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: deprecated_member_use_from_same_package, unnecessary_null_in_if_null_operators, prefer_null_aware_operators
part of 'basic_with_type_params.dart';

// **************************************************************************
// OverReactBuilder (package:over_react/src/builder.dart)
// **************************************************************************

// React component factory implementation.
//
// Registers component implementation and links type meta to builder factory.
final $BasicComponentFactory = registerComponent(() => _$BasicComponent(),
    builderFactory: Basic,
    componentClass: BasicComponent,
    isWrapper: false,
    parentType: null,
    displayName: 'Basic');

abstract class _$BasicPropsAccessorsMixin<T, U extends UiProps>
    implements _$BasicProps<T, U> {
  @override
  Map get props;

  /// <!-- Generated from [_$BasicProps.someGenericListProp] -->
  @override
  List<T> get someGenericListProp =>
      props[_$key__someGenericListProp___$BasicProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$BasicProps.someGenericListProp] -->
  @override
  set someGenericListProp(List<T> value) =>
      props[_$key__someGenericListProp___$BasicProps] = value;

  /// <!-- Generated from [_$BasicProps.somePropsClass] -->
  @override
  U get somePropsClass =>
      props[_$key__somePropsClass___$BasicProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$BasicProps.somePropsClass] -->
  @override
  set somePropsClass(U value) =>
      props[_$key__somePropsClass___$BasicProps] = value;
  /* GENERATED CONSTANTS */
  static const PropDescriptor _$prop__someGenericListProp___$BasicProps =
      PropDescriptor(_$key__someGenericListProp___$BasicProps);
  static const PropDescriptor _$prop__somePropsClass___$BasicProps =
      PropDescriptor(_$key__somePropsClass___$BasicProps);
  static const String _$key__someGenericListProp___$BasicProps =
      'BasicProps.someGenericListProp';
  static const String _$key__somePropsClass___$BasicProps =
      'BasicProps.somePropsClass';

  static const List<PropDescriptor> $props = [
    _$prop__someGenericListProp___$BasicProps,
    _$prop__somePropsClass___$BasicProps
  ];
  static const List<String> $propKeys = [
    _$key__someGenericListProp___$BasicProps,
    _$key__somePropsClass___$BasicProps
  ];
}

const PropsMeta _$metaForBasicProps = PropsMeta(
  fields: _$BasicPropsAccessorsMixin.$props,
  keys: _$BasicPropsAccessorsMixin.$propKeys,
);

class BasicProps<T, U extends UiProps> extends _$BasicProps<T, U>
    with _$BasicPropsAccessorsMixin<T, U> {
  static const PropsMeta meta = _$metaForBasicProps;
}

_$$BasicProps _$Basic([Map backingProps]) => _$$BasicProps(backingProps);

// Concrete props implementation.
//
// Implements constructor and backing map, and links up to generated component factory.
class _$$BasicProps<T, U extends UiProps> extends _$BasicProps<T, U>
    with _$BasicPropsAccessorsMixin<T, U>
    implements BasicProps<T, U> {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$BasicProps(Map backingMap) : this._props = {} {
    this._props = backingMap ?? {};
  }

  /// The backing props map proxied by this class.
  @override
  Map get props => _props;
  Map _props;

  /// Let `UiProps` internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The `ReactComponentFactory` associated with the component built by this class.
  @override
  ReactComponentFactoryProxy get componentFactory => $BasicComponentFactory;

  /// The default namespace for the prop getters/setters generated for this class.
  @override
  String get propKeyNamespace => 'BasicProps.';
}

// Concrete component implementation mixin.
//
// Implements typed props/state factories, defaults `consumedPropKeys` to the keys
// generated for the associated props class.
class _$BasicComponent extends BasicComponent {
  @override
  _$$BasicProps typedPropsFactory(Map backingMap) => _$$BasicProps(backingMap);

  /// Let `UiComponent` internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The default consumed props, taken from _$BasicProps.
  /// Used in `ConsumedProps` if [consumedProps] is not overridden.
  @override
  final List<ConsumedProps> $defaultConsumedProps = const [_$metaForBasicProps];
}
