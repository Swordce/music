import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QQLoginPage extends Page<QQLoginState, Map<String, dynamic>> {
  QQLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<QQLoginState>(
                adapter: null,
                slots: <String, Dependent<QQLoginState>>{
                }),
            middleware: <Middleware<QQLoginState>>[
            ],);

}
