import 'package:over_react/over_react.dart';

import '../../demo_components.dart';

ReactElement checkboxToggleButtonDemo() =>
  (ToggleButtonGroup()
    ..toggleType = ToggleBehaviorType.CHECKBOX
  )(
    (ToggleButton()
      ..value = '1'
    )('Checkbox 1'),
    (ToggleButton()
      ..value = '2'
      ..defaultChecked = true
    )('Checkbox 2'),
    (ToggleButton()
      ..value = '3'
    )('Checkbox 3')
  );
