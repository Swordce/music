import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/netease_cloud/login/reducer.dart';
import 'package:music/pages/netease_cloud/login/view.dart';


import 'effect.dart';
import 'state.dart';

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
