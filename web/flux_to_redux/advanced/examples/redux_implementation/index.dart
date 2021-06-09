// @dart=2.7
// ^ Do not remove until migrated to null safety. More info at https://wiki.atl.workiva.net/pages/viewpage.action?pageId=189370832
// Copyright 2020 Workiva Inc.
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

import 'dart:html';

import 'package:over_react/components.dart' as v2;
import 'package:over_react/over_react_flux.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:over_react/over_react_redux.dart';

import './components/should_not_update.dart';
import './components/random_color_redux.dart';
import './store.dart';

main() {
  react_dom.render(
      v2.ErrorBoundary()(
        (ReduxProvider()..store = reduxStore)(
          RandomColorRedux()(),
          ShouldNotUpdate()(),
        ),
      ),
      querySelector('#content'));
}
