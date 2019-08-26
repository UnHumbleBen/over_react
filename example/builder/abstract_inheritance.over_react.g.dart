// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_inheritance.dart';

// **************************************************************************
// OverReactBuilder (package:over_react/src/builder.dart)
// **************************************************************************

// React component factory implementation.
//
// Registers component implementation and links type meta to builder factory.
final $SubComponentFactory = registerComponent(() => new _$SubComponent(),
    builderFactory: Sub,
    componentClass: SubComponent,
    isWrapper: false,
    parentType: null,
    displayName: 'Sub');

abstract class _$SubPropsAccessorsMixin implements _$SubProps {
  @override
  Map get props;

  /// <!-- Generated from [_$SubProps.subProp] -->
  @override
  String get subProp => props[_$key__subProp___$SubProps];

  /// <!-- Generated from [_$SubProps.subProp] -->
  @override
  set subProp(String value) => props[_$key__subProp___$SubProps] = value;
  /* GENERATED CONSTANTS */
  static const PropDescriptor _$prop__subProp___$SubProps =
      const PropDescriptor(_$key__subProp___$SubProps);
  static const String _$key__subProp___$SubProps = 'SubProps.subProp';

  static const List<PropDescriptor> $props = const [
    _$prop__subProp___$SubProps
  ];
  static const List<String> $propKeys = const [_$key__subProp___$SubProps];
}

const PropsMeta _$metaForSubProps = const PropsMeta(
  fields: _$SubPropsAccessorsMixin.$props,
  keys: _$SubPropsAccessorsMixin.$propKeys,
);

class SubProps extends _$SubProps with _$SubPropsAccessorsMixin {
  static const PropsMeta meta = _$metaForSubProps;
}

_$$SubProps _$Sub([Map backingProps]) => new _$$SubProps(backingProps);

// Concrete props implementation.
//
// Implements constructor and backing map, and links up to generated component factory.
class _$$SubProps extends _$SubProps
    with _$SubPropsAccessorsMixin
    implements SubProps {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$SubProps(Map backingMap) : this.props = backingMap ?? {};

  /// The backing props map proxied by this class.
  @override
  final Map props;

  /// Let [UiProps] internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The [ReactComponentFactory] associated with the component built by this class.
  @override
  ReactComponentFactoryProxy get componentFactory => $SubComponentFactory;

  /// The default namespace for the prop getters/setters generated for this class.
  @override
  String get propKeyNamespace => 'SubProps.';
}

abstract class _$SubStateAccessorsMixin implements _$SubState {
  @override
  Map get state;

  /// <!-- Generated from [_$SubState.subState] -->
  @override
  String get subState => state[_$key__subState___$SubState];

  /// <!-- Generated from [_$SubState.subState] -->
  @override
  set subState(String value) => state[_$key__subState___$SubState] = value;
  /* GENERATED CONSTANTS */
  static const StateDescriptor _$prop__subState___$SubState =
      const StateDescriptor(_$key__subState___$SubState);
  static const String _$key__subState___$SubState = 'SubState.subState';

  static const List<StateDescriptor> $state = const [
    _$prop__subState___$SubState
  ];
  static const List<String> $stateKeys = const [_$key__subState___$SubState];
}

const StateMeta _$metaForSubState = const StateMeta(
  fields: _$SubStateAccessorsMixin.$state,
  keys: _$SubStateAccessorsMixin.$stateKeys,
);

class SubState extends _$SubState with _$SubStateAccessorsMixin {
  static const StateMeta meta = _$metaForSubState;
}

// Concrete state implementation.
//
// Implements constructor and backing map.
class _$$SubState extends _$SubState
    with _$SubStateAccessorsMixin
    implements SubState {
  // This initializer of `_state` to an empty map, as well as the reassignment
  // of `_state` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$SubState(Map backingMap) : this.state = backingMap ?? {};

  /// The backing state map proxied by this class.
  @override
  final Map state;

  /// Let [UiState] internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;
}

// Concrete component implementation mixin.
//
// Implements typed props/state factories, defaults `consumedPropKeys` to the keys
// generated for the associated props class.
class _$SubComponent extends SubComponent {
  @override
  _$$SubProps typedPropsFactory(Map backingMap) => new _$$SubProps(backingMap);

  @override
  _$$SubState typedStateFactory(Map backingMap) => new _$$SubState(backingMap);

  /// Let [UiComponent] internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The default consumed props, taken from _$SubProps.
  /// Used in [UiProps.consumedProps] if [consumedProps] is not overridden.
  @override
  final List<ConsumedProps> $defaultConsumedProps = const [_$metaForSubProps];
}

abstract class _$SuperPropsAccessorsMixin implements _$SuperProps {
  @override
  Map get props;

  /// <!-- Generated from [_$SuperProps.superProp] -->
  @override
  String get superProp => props[_$key__superProp___$SuperProps];

  /// <!-- Generated from [_$SuperProps.superProp] -->
  @override
  set superProp(String value) => props[_$key__superProp___$SuperProps] = value;
  /* GENERATED CONSTANTS */
  static const PropDescriptor _$prop__superProp___$SuperProps =
      const PropDescriptor(_$key__superProp___$SuperProps);
  static const String _$key__superProp___$SuperProps = 'SuperProps.superProp';

  static const List<PropDescriptor> $props = const [
    _$prop__superProp___$SuperProps
  ];
  static const List<String> $propKeys = const [_$key__superProp___$SuperProps];
}

const PropsMeta _$metaForSuperProps = const PropsMeta(
  fields: _$SuperPropsAccessorsMixin.$props,
  keys: _$SuperPropsAccessorsMixin.$propKeys,
);

abstract class SuperProps extends _$SuperProps with _$SuperPropsAccessorsMixin {
  static const PropsMeta meta = _$metaForSuperProps;
}

abstract class _$SuperStateAccessorsMixin implements _$SuperState {
  @override
  Map get state;

  /// <!-- Generated from [_$SuperState.superState] -->
  @override
  String get superState => state[_$key__superState___$SuperState];

  /// <!-- Generated from [_$SuperState.superState] -->
  @override
  set superState(String value) =>
      state[_$key__superState___$SuperState] = value;
  /* GENERATED CONSTANTS */
  static const StateDescriptor _$prop__superState___$SuperState =
      const StateDescriptor(_$key__superState___$SuperState);
  static const String _$key__superState___$SuperState = 'SuperState.superState';

  static const List<StateDescriptor> $state = const [
    _$prop__superState___$SuperState
  ];
  static const List<String> $stateKeys = const [
    _$key__superState___$SuperState
  ];
}

const StateMeta _$metaForSuperState = const StateMeta(
  fields: _$SuperStateAccessorsMixin.$state,
  keys: _$SuperStateAccessorsMixin.$stateKeys,
);

abstract class SuperState extends _$SuperState with _$SuperStateAccessorsMixin {
  static const StateMeta meta = _$metaForSuperState;
}
