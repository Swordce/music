import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/widgets/common_playlist/component.dart';
import 'package:music/pages/music/widgets/common_playlist/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

//歌单详情

class PlaylistDetailPage extends Page<PlaylistDetailState, Map<String, dynamic>> {
  PlaylistDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistDetailState>(
                adapter: null,
                slots: <String, Dependent<PlaylistDetailState>>{
                  'global_play_view':CommonPlaylistConnector() + CommonPlaylistComponent(),
                }),
            middleware: <Middleware<PlaylistDetailState>>[
            ],);

}
