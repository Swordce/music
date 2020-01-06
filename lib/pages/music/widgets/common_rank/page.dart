import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/widgets/common_playlist/component.dart';
import 'package:music/pages/music/widgets/common_playlist/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RankPage extends Page<RankState, Map<String, dynamic>> {
  RankPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RankState>(
                adapter: null,
                slots: <String, Dependent<RankState>>{
                  'global_play_view':CommonPlaylistConnector3() + CommonPlaylistComponent(),
                }),
            middleware: <Middleware<RankState>>[
            ],);

}
