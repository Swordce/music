import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NeteaseCloudLoginPage extends Page<NeteaseCloudLoginState, Map<String, dynamic>> {
  NeteaseCloudLoginPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NeteaseCloudLoginState>(
                adapter: null,
                slots: <String, Dependent<NeteaseCloudLoginState>>{
                }),
            middleware: <Middleware<NeteaseCloudLoginState>>[
            ],);

}
