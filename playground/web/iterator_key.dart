import 'package:over_react/over_react.dart';

part 'iterator_key.over_react.g.dart';

ReactElement MissingKeyInList() {
  return (
      Dom.div()(
        [Dom.p()(), Dom.p()()],
        '🤔',
        [(Dom.div()..key='')(), Dom.div()(), Dom.div()()],
      ));
}

ReactElement MissingKeyInMap() {
  List coolStrings = ['cool', 'cooler', '0deg kelvin'];

  return (
    Dom.div()(
//      coolStrings.map((s) => Dom.div()(s)),
//      coolStrings.map((s) => Dom.div()(s)).toList(),
      coolStrings.map((s) => (Dom.div()..key='bruh')((Dom.p())(s))),
//      coolStrings.map((s) => s),
    ));
}
