import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_flux.dart';
import 'package:over_react/over_react_redux.dart';

import 'stores.dart';

part 'should_not_update.over_react.g.dart';

UiFactory<ShouldNotUpdateProps> ConnectedShouldNotUpdate = connect<TopLevelStore, ShouldNotUpdateProps>(mapStateToProps: (_) => {}, pure: false,
)(ShouldNotUpdate);

@Factory()
UiFactory<ShouldNotUpdateProps> ShouldNotUpdate = _$ShouldNotUpdate;

@Props()
class _$ShouldNotUpdateProps extends UiProps {
  String text;
}

@Component2()
class ShouldNotUpdateComponent extends UiComponent2<ShouldNotUpdateProps> {
  @override
  render() {
    return (
        (Dom.div()..style = {
          'padding': '50px',
          'backgroundColor': 'gray',
          'color': 'white'
        })(
          'In a full Redux implementation, this component would not update. However,'
              'it will in a Reflux (Redux & Flux together) implementation it will.',
        )
    );
  }

  @override
  void componentDidUpdate(Map prevProps, Map prevState, [snapshot]) {

    print('updated!');

    super.componentDidUpdate(prevProps, prevState, snapshot);
  }
}