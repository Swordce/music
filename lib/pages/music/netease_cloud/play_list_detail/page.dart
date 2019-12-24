import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//歌单详情

class PlayListPage extends Page<PlayListState, Map<String, dynamic>> {
  PlayListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayListState>(
                adapter: null,
                slots: <String, Dependent<PlayListState>>{
                }),
            middleware: <Middleware<PlayListState>>[
            ],);

}
