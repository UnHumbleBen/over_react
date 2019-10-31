// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: deprecated_member_use_from_same_package, unnecessary_null_in_if_null_operators, prefer_null_aware_operators
part of 'generic_inheritance_sub.dart';

// **************************************************************************
// OverReactBuilder (package:over_react/src/builder.dart)
// **************************************************************************

// React component factory implementation.
//
// Registers component implementation and links type meta to builder factory.
final $GenericSubComponentFactory = registerComponent(
    () => _$GenericSubComponent(),
    builderFactory: GenericSub,
    componentClass: GenericSubComponent,
    isWrapper: false,
    parentType: null,
    displayName: 'GenericSub');

abstract class _$GenericSubPropsAccessorsMixin implements _$GenericSubProps {
  @override
  Map get props;

  /// <!-- Generated from [_$GenericSubProps.subProp] -->
  @override
  String get subProp =>
      props[_$key__subProp___$GenericSubProps] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSubProps.subProp] -->
  @override
  set subProp(String value) => props[_$key__subProp___$GenericSubProps] = value;
  /* GENERATED CONSTANTS */
  static const PropDescriptor _$prop__subProp___$GenericSubProps =
      PropDescriptor(_$key__subProp___$GenericSubProps);
  static const String _$key__subProp___$GenericSubProps =
      'GenericSubProps.subProp';

  static const List<PropDescriptor> $props = [
    _$prop__subProp___$GenericSubProps
  ];
  static const List<String> $propKeys = [_$key__subProp___$GenericSubProps];
}

const PropsMeta _$metaForGenericSubProps = PropsMeta(
  fields: _$GenericSubPropsAccessorsMixin.$props,
  keys: _$GenericSubPropsAccessorsMixin.$propKeys,
);

class GenericSubProps extends _$GenericSubProps
    with _$GenericSubPropsAccessorsMixin {
  static const PropsMeta meta = _$metaForGenericSubProps;
}

_$$GenericSubProps _$GenericSub([Map backingProps]) =>
    _$$GenericSubProps(backingProps);

// Concrete props implementation.
//
// Implements constructor and backing map, and links up to generated component factory.
class _$$GenericSubProps extends _$GenericSubProps
    with _$GenericSubPropsAccessorsMixin
    implements GenericSubProps {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$GenericSubProps(Map backingMap) : this._props = {} {
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
      $GenericSubComponentFactory;

  /// The default namespace for the prop getters/setters generated for this class.
  @override
  String get propKeyNamespace => 'GenericSubProps.';
}

abstract class _$GenericSubStateAccessorsMixin implements _$GenericSubState {
  @override
  Map get state;

  /// <!-- Generated from [_$GenericSubState.subState] -->
  @override
  String get subState =>
      state[_$key__subState___$GenericSubState] ??
      null; // Add ` ?? null` to workaround DDC bug: <https://github.com/dart-lang/sdk/issues/36052>;
  /// <!-- Generated from [_$GenericSubState.subState] -->
  @override
  set subState(String value) =>
      state[_$key__subState___$GenericSubState] = value;
  /* GENERATED CONSTANTS */
  static const StateDescriptor _$prop__subState___$GenericSubState =
      StateDescriptor(_$key__subState___$GenericSubState);
  static const String _$key__subState___$GenericSubState =
      'GenericSubState.subState';

  static const List<StateDescriptor> $state = [
    _$prop__subState___$GenericSubState
  ];
  static const List<String> $stateKeys = [_$key__subState___$GenericSubState];
}

const StateMeta _$metaForGenericSubState = StateMeta(
  fields: _$GenericSubStateAccessorsMixin.$state,
  keys: _$GenericSubStateAccessorsMixin.$stateKeys,
);

class GenericSubState extends _$GenericSubState
    with _$GenericSubStateAccessorsMixin {
  static const StateMeta meta = _$metaForGenericSubState;
}

// Concrete state implementation.
//
// Implements constructor and backing map.
class _$$GenericSubState extends _$GenericSubState
    with _$GenericSubStateAccessorsMixin
    implements GenericSubState {
  // This initializer of `_state` to an empty map, as well as the reassignment
  // of `_state` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$GenericSubState(Map backingMap) : this._state = {} {
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
class _$GenericSubComponent extends GenericSubComponent {
  @override
  _$$GenericSubProps typedPropsFactory(Map backingMap) =>
      _$$GenericSubProps(backingMap);

  @override
  _$$GenericSubState typedStateFactory(Map backingMap) =>
      _$$GenericSubState(backingMap);

  /// Let `UiComponent` internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The default consumed props, taken from _$GenericSubProps.
  /// Used in `ConsumedProps` if [consumedProps] is not overridden.
  @override
  final List<ConsumedProps> $defaultConsumedProps = const [
    _$metaForGenericSubProps
  ];
}
