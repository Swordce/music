import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/home/component.dart';
import 'package:music/pages/home/connector/music_connector.dart';
import 'package:music/pages/netease_cloud/music/page.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter:null,
              slots: <String, Dependent<HomeState>>{
              }),
          middleware: <Middleware<HomeState>>[],
        );

  @override
  ComponentState<HomeState> createState() {
    return HomeComponentState();
  }
}
