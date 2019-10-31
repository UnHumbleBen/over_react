// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: deprecated_member_use_from_same_package, unnecessary_null_in_if_null_operators, prefer_null_aware_operators
part of 'generic_inheritance_super.dart';

// **************************************************************************
// OverReactBuilder (package:over_react/src/builder.dart)
// **************************************************************************

// React component factory implementation.
//
// Registers component implementation and links type meta to builder factory.
final $GenericSuperComponentFactory = registerComponent(
    () => _$GenericSuperComponent(),
    builderFactory: GenericSuper,
    componentClass: GenericSuperComponent,
    isWrapper: false,
    parentType: null,
    displayName: 'GenericSuper');

abstract class _$GenericSuperPropsAccessorsMixin
    implements _$GenericSuperProps {
  @override
  Map get props;

  /// <!-- Generated from [_$GenericSuperProps.otherSuperProp] -->
  @override
  String get otherSuperProp =>
      props[_$key__otherSuperProp___$GenericSuperProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSuperProps.otherSuperProp] -->
  @override
  set otherSuperProp(String value) =>
      props[_$key__otherSuperProp___$GenericSuperProps] = value;

  /// <!-- Generated from [_$GenericSuperProps.superProp] -->
  @override
  String get superProp =>
      props[_$key__superProp___$GenericSuperProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSuperProps.superProp] -->
  @override
  set superProp(String value) =>
      props[_$key__superProp___$GenericSuperProps] = value;

  /// <!-- Generated from [_$GenericSuperProps.superProp1] -->
  @override
  String get superProp1 =>
      props[_$key__superProp1___$GenericSuperProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSuperProps.superProp1] -->
  @override
  set superProp1(String value) =>
      props[_$key__superProp1___$GenericSuperProps] = value;
  /* GENERATED CONSTANTS */
  static const PropDescriptor _$prop__otherSuperProp___$GenericSuperProps =
      PropDescriptor(_$key__otherSuperProp___$GenericSuperProps);
  static const PropDescriptor _$prop__superProp___$GenericSuperProps =
      PropDescriptor(_$key__superProp___$GenericSuperProps);
  static const PropDescriptor _$prop__superProp1___$GenericSuperProps =
      PropDescriptor(_$key__superProp1___$GenericSuperProps);
  static const String _$key__otherSuperProp___$GenericSuperProps =
      'GenericSuperProps.otherSuperProp';
  static const String _$key__superProp___$GenericSuperProps =
      'GenericSuperProps.superProp';
  static const String _$key__superProp1___$GenericSuperProps =
      'GenericSuperProps.superProp1';

  static const List<PropDescriptor> $props = [
    _$prop__otherSuperProp___$GenericSuperProps,
    _$prop__superProp___$GenericSuperProps,
    _$prop__superProp1___$GenericSuperProps
  ];
  static const List<String> $propKeys = [
    _$key__otherSuperProp___$GenericSuperProps,
    _$key__superProp___$GenericSuperProps,
    _$key__superProp1___$GenericSuperProps
  ];
}

const PropsMeta _$metaForGenericSuperProps = PropsMeta(
  fields: _$GenericSuperPropsAccessorsMixin.$props,
  keys: _$GenericSuperPropsAccessorsMixin.$propKeys,
);

class GenericSuperProps extends _$GenericSuperProps
    with _$GenericSuperPropsAccessorsMixin {
  static const PropsMeta meta = _$metaForGenericSuperProps;
}

_$$GenericSuperProps _$GenericSuper([Map backingProps]) =>
    _$$GenericSuperProps(backingProps);

// Concrete props implementation.
//
// Implements constructor and backing map, and links up to generated component factory.
class _$$GenericSuperProps extends _$GenericSuperProps
    with _$GenericSuperPropsAccessorsMixin
    implements GenericSuperProps {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$GenericSuperProps(Map backingMap) : this._props = {} {
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
  ReactComponentFactoryProxy get componentFactory =>
      $GenericSuperComponentFactory;

  /// The default namespace for the prop getters/setters generated for this class.
  @override
  String get propKeyNamespace => 'GenericSuperProps.';
}

abstract class _$GenericSuperStateAccessorsMixin
    implements _$GenericSuperState {
  @override
  Map get state;

  /// <!-- Generated from [_$GenericSuperState.superState] -->
  @override
  String get superState =>
      state[_$key__superState___$GenericSuperState] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSuperState.superState] -->
  @override
  set superState(String value) =>
      state[_$key__superState___$GenericSuperState] = value;
  /* GENERATED CONSTANTS */
  static const StateDescriptor _$prop__superState___$GenericSuperState =
      StateDescriptor(_$key__superState___$GenericSuperState);
  static const String _$key__superState___$GenericSuperState =
      'GenericSuperState.superState';

  static const List<StateDescriptor> $state = [
    _$prop__superState___$GenericSuperState
  ];
  static const List<String> $stateKeys = [
    _$key__superState___$GenericSuperState
  ];
}

const StateMeta _$metaForGenericSuperState = StateMeta(
  fields: _$GenericSuperStateAccessorsMixin.$state,
  keys: _$GenericSuperStateAccessorsMixin.$stateKeys,
);

class GenericSuperState extends _$GenericSuperState
    with _$GenericSuperStateAccessorsMixin {
  static const StateMeta meta = _$metaForGenericSuperState;
}

// Concrete state implementation.
//
// Implements constructor and backing map.
class _$$GenericSuperState extends _$GenericSuperState
    with _$GenericSuperStateAccessorsMixin
    implements GenericSuperState {
  // This initializer of `_state` to an empty map, as well as the reassignment
  // of `_state` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$GenericSuperState(Map backingMap) : this._state = {} {
    this._state = backingMap ?? {};
  }

  /// The backing state map proxied by this class.
  @override
  Map get state => _state;
  Map _state;

  /// Let `UiState` internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;
}

// Concrete component implementation mixin.
//
// Implements typed props/state factories, defaults `consumedPropKeys` to the keys
// generated for the associated props class.
class _$GenericSuperComponent extends GenericSuperComponent {
  @override
  _$$GenericSuperProps typedPropsFactory(Map backingMap) =>
      _$$GenericSuperProps(backingMap);

  @override
  _$$GenericSuperState typedStateFactory(Map backingMap) =>
      _$$GenericSuperState(backingMap);

  /// Let `UiComponent` internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The default consumed props, taken from _$GenericSuperProps.
  /// Used in `ConsumedProps` if [consumedProps] is not overridden.
  @override
  final List<ConsumedProps> $defaultConsumedProps = const [
    _$metaForGenericSuperProps
  ];
}
