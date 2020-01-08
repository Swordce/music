import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/widgets/common_playlist/component.dart';
import 'package:music/pages/music/widgets/common_playlist/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlaylistCenterPage extends Page<PlaylistCenterState, Map<String, dynamic>> with TickerProviderMixin {
  PlaylistCenterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistCenterState>(
                adapter: null,
                slots: <String, Dependent<PlaylistCenterState>>{
                  'global_play_view':CommonPlaylistConnector2() + CommonPlaylistComponent(),
                }),
            middleware: <Middleware<PlaylistCenterState>>[
            ],);

}
