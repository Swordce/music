import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class XiamiLoginPage extends Page<XiamiLoginState, Map<String, dynamic>> {
  XiamiLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<XiamiLoginState>(
                adapter: null,
                slots: <String, Dependent<XiamiLoginState>>{
                }),
            middleware: <Middleware<XiamiLoginState>>[
            ],);

}
