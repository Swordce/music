import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PreLoginPage extends Page<PreLoginState, Map<String, dynamic>> {
  PreLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PreLoginState>(
                adapter: null,
                slots: <String, Dependent<PreLoginState>>{
                }),
            middleware: <Middleware<PreLoginState>>[
            ],);

}
