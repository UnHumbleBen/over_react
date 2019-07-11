// Copyright 2019 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of over_react.component_declaration.component_base;

/// The basis for an over_react component that is compatible with ReactJS 16 ([react.Component2]).
///
/// Includes support for strongly-typed [UiProps] and utilities for prop and CSS classname forwarding.
///
/// __Prop and CSS className forwarding when your component renders a composite component:__
///
///     @Component2()
///     class YourComponent extends UiComponent2<YourProps> {
///       Map getDefaultProps() => (newProps()
///         ..aPropOnYourComponent = /* default value */
///       );
///
///       @override
///       render() {
///         var classes = forwardingClassNameBuilder()
///           ..add('your-component-base-class')
///           ..add('a-conditional-class', shouldApplyConditionalClass);
///
///         return (SomeChildComponent()
///           ..addProps(copyUnconsumedProps())
///           ..className = classes.toClassName()
///         )(props.children);
///       }
///     }
///
/// __Prop and CSS className forwarding when your component renders a DOM component:__
///
///     @Component2()
///     class YourComponent extends UiComponent2<YourProps> {
///       @override
///       render() {
///         var classes = forwardingClassNameBuilder()
///           ..add('your-component-base-class')
///           ..add('a-conditional-class', shouldApplyConditionalClass);
///
///         return (Dom.div()
///           ..addProps(copyUnconsumedDomProps())
///           ..className = classes.toClassName()
///         )(props.children);
///       }
///     }
///
/// > Related: [UiStatefulComponent2]
abstract class UiComponent2<TProps extends UiProps> extends react.Component2
    with _DisposableManagerProxy
    implements UiComponent<TProps> {
  @override
  Map getDefaultProps() => new JsBackedMap();

  /// The props for the non-forwarding props defined in this component.
  @override
  Iterable<ConsumedProps> get consumedProps => null;

  /// Returns a copy of this component's props with keys found in [consumedProps] omitted.
  ///
  /// > Should be used alongside [forwardingClassNameBuilder].
  ///
  /// > Related [copyUnconsumedDomProps]
  @override
  Map copyUnconsumedProps() {
    var consumedPropKeys = consumedProps
            ?.map((ConsumedProps consumedProps) => consumedProps.keys) ??
        const [];

    return copyProps(keySetsToOmit: consumedPropKeys);
  }

  /// Returns a copy of this component's props with keys found in [consumedProps] and non-DOM props omitted.
  ///
  /// > Should be used alongside [forwardingClassNameBuilder].
  ///
  /// > Related [copyUnconsumedProps]
  @override
  Map copyUnconsumedDomProps() {
    var consumedPropKeys = consumedProps
            ?.map((ConsumedProps consumedProps) => consumedProps.keys) ??
        const [];

    return copyProps(onlyCopyDomProps: true, keySetsToOmit: consumedPropKeys);
  }

  /// Returns a copy of this component's props with React props optionally omitted, and
  /// with the specified [keysToOmit] and [keySetsToOmit] omitted.
  @override
  Map copyProps(
      {bool omitReservedReactProps: true,
      bool onlyCopyDomProps: false,
      Iterable keysToOmit,
      Iterable<Iterable> keySetsToOmit}) {
    return getPropsToForward(this.props,
        omitReactProps: omitReservedReactProps,
        onlyCopyDomProps: onlyCopyDomProps,
        keysToOmit: keysToOmit,
        keySetsToOmit: keySetsToOmit);
  }

  /// Throws a [PropError] if [appliedProps] are invalid.
  ///
  /// This is called automatically with the latest props available during [componentWillReceiveProps] and
  /// [componentWillMount], and can also be called manually for custom validation.
  ///
  /// Override with a custom implementation to easily add validation (and don't forget to call super!)
  ///
  ///     @mustCallSuper
  ///     void validateProps(Map appliedProps) {
  ///       super.validateProps(appliedProps);
  ///
  ///       var tProps = typedPropsFactory(appliedProps);
  ///       if (tProps.items.length.isOdd) {
  ///         throw new PropError.value(tProps.items, 'items', 'must have an even number of items, because reasons');
  ///       }
  ///     }
  /// __Deprecated.__ Use [propTypes] instead. Will be removed in the `4.0.0` release.
  @Deprecated('4.0.0')
  @mustCallSuper
  @override
  void validateProps(Map appliedProps) {
    throw UnsupportedError('[validateProps] is not supported in Component2, use [propTypes] instead.');
  }

  /// Validates that props with the `@requiredProp` annotation are present.
  /// __Deprecated.__ Use [propTypes] instead. Will be removed in the `4.0.0` release.
  @Deprecated('4.0.0')
  @override
  void validateRequiredProps(Map appliedProps) {
    throw UnsupportedError('[validateRequiredProps] is not supported in Component2, use [propTypes] instead.');
  }

  /// Returns a new ClassNameBuilder with className and blacklist values added from [CssClassPropsMixin.className] and
  /// [CssClassPropsMixin.classNameBlacklist], if they are specified.
  ///
  /// This method should be used as the basis for the classNames of components receiving forwarded props.
  ///
  /// > Should be used alongside [copyUnconsumedProps] or [copyUnconsumedDomProps].
  @override
  ClassNameBuilder forwardingClassNameBuilder() {
    return new ClassNameBuilder.fromProps(this.props);
  }

  @override
  @mustCallSuper
  void componentWillUnmount() {
    _disposableProxy?.dispose();
  }

  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------
  //   BEGIN Typed props helpers
  //

  /// A typed props object corresponding to the current untyped props Map ([unwrappedProps]).
  ///
  /// Created using [typedPropsFactory] and cached for each Map instance.
  @override
  TProps get props {
    // This needs to be a concrete implementation in Dart 2 for soundness;
    // without it, you get a confusing error. See: https://github.com/dart-lang/sdk/issues/36191
    throw new UngeneratedError();
  }

  /// Equivalent to setting [unwrappedProps], but needed by react-dart to effect props changes.
  @override
  set props(Map value) => super.props = value;

  /// The props Map that will be used to create the typed [props] object.
  @override
  Map get unwrappedProps => super.props;
  @override
  set unwrappedProps(Map value) => super.props = value;

  /// Returns a typed props object backed by the specified [propsMap].
  ///
  /// Required to properly instantiate the generic [TProps] class.
  @override
  TProps typedPropsFactory(Map propsMap);

  /// Returns a typed props object backed by the specified [propsMap].
  ///
  /// Required to properly instantiate the generic [TProps] class.
  ///
  /// This should be used where possible over [typedPropsFactory] to allow for
  /// more efficient dart2js output.
  TProps typedPropsFactoryJs(JsBackedMap propsMap);

  /// Returns a typed props object backed by a new Map.
  ///
  /// Convenient for use with [getDefaultProps].
  @override
  TProps newProps() => typedPropsFactoryJs(new JsBackedMap());

  //
  //   END Typed props helpers
  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------

  @override
  Map<String, react.PropValidator<TProps>> get propTypes => {};

  // TODO: Would prefer to remove this from the public API and possibly pass it into the adapter.
  @override
  Map<String, react.JsPropValidator> get jsPropTypesMap {

    // Add [PropValidator]s for props annotated as required.
    var newPropTypes = Map<String, react.PropValidator<TProps>>.from(propTypes);
    consumedProps?.forEach((ConsumedProps consumedProps) {
      consumedProps?.props?.forEach((PropDescriptor prop) {
        if (!prop.isRequired) return null;
        if (prop.isNullable && (props?.containsKey(prop.key) ?? false)) return null;
        if (!prop.isNullable && (props?.containsKey(prop.key) ?? false) && props[prop.key] != null) return null;
        Error requiredPropValidator(
            TProps props,
            String propName,
            String componentName,
            String location,
            String propFullName,
          ) {
            if (props[propName] == null) {
              return new PropError.required(propName, prop.errorMessage);
            }
            return null;
          }
          newPropTypes.addEntries([MapEntry(prop.key, requiredPropValidator)]);
      });
    });

    // jsifies propTypes before passing them to the javascript side.
    return jsifyPropTypes<TProps>(newPropTypes, (jsMap) => typedPropsFactoryJs(JsBackedMap.fromJs(jsMap)));
  }
}

/// The basis for a _stateful_ over_react component that is compatible with ReactJS 16 ([react.Component2]).
///
/// Includes support for strongly-typed [UiState] in-addition-to the
/// strongly-typed props and utilities for prop and CSS classname forwarding provided by [UiComponent].
///
/// __Initializing state:__
///
///     @Component2()
///     class YourComponent extends UiStatefulComponent2<YourProps, YourState> {
///       @override
///       void init() {
///         this.state = (newState()
///           ..aStateKeyWithinYourStateClass = /* default value */
///         );
///       }
///
///       @override
///       render() {
///         var classes = forwardingClassNameBuilder()
///           ..add('your-component-base-class')
///           ..add('a-conditional-class', state.aStateKeyWithinYourStateClass);
///
///         return (SomeChildComponent()
///           ..addProps(copyUnconsumedProps())
///           ..className = classes.toClassName()
///         )(props.children);
///       }
///     }
abstract class UiStatefulComponent2<TProps extends UiProps,
        TState extends UiState> extends UiComponent2<TProps>
    implements UiStatefulComponent<TProps, TState> {
  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------
  //   BEGIN Typed state helpers
  //

  /// A typed state object corresponding to the current untyped state Map ([unwrappedState]).
  ///
  /// Created using [typedStateFactory] and cached for each Map instance.
  @override
  TState get state {
    // This needs to be a concrete implementation in Dart 2 for soundness;
    // without it, you get a confusing error. See: https://github.com/dart-lang/sdk/issues/36191
    throw new UngeneratedError();
  }

  /// Equivalent to setting [unwrappedState], but needed by react-dart to effect state changes.
  @override
  set state(Map value) => super.state = value;

  /// The state Map that will be used to create the typed [state] object.
  @override
  Map get unwrappedState => super.state;
  @override
  set unwrappedState(Map value) => super.state = value;

  /// Returns a typed state object backed by the specified [stateMap].
  ///
  /// Required to properly instantiate the generic [TState] class.
  @override
  TState typedStateFactory(Map stateMap);

  /// Returns a typed state object backed by the specified [stateMap].
  ///
  /// Required to properly instantiate the generic [TState] class.
  ///
  /// This should be used where possible over [typedStateFactory] to allow for
  /// more efficient dart2js output.
  TState typedStateFactoryJs(JsBackedMap stateMap);

  /// Returns a typed state object backed by a new Map.
  ///
  /// Convenient for use with [getInitialState] and [setState].
  @override
  TState newState() => typedStateFactoryJs(new JsBackedMap());

  //
  //   END Typed state helpers
  // ----------------------------------------------------------------------
  // ----------------------------------------------------------------------
}
