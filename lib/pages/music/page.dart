import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/play/component.dart';
import 'package:music/pages/music/netease_cloud/play/state.dart';
import 'package:music/pages/music/qq_cloud/play/component.dart';
import 'package:music/pages/music/qq_cloud/play/state.dart';
import 'package:music/pages/music/xiami_cloud/play/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'xiami_cloud/play/component.dart';

class MusicPage extends Page<MusicState, Map<String, dynamic>> {
  MusicPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MusicState>(
                adapter: null,
                slots: <String, Dependent<MusicState>>{
                  'netease_music': NeteaseConnector() + NeteaseComponent(),
                  'qq_music': QQMusicConnector() + QQMusicComponent(),
                  'xiami_music':XiamiMusicConnector() + XiamiMusicComponent(),
                }),
            middleware: <Middleware<MusicState>>[
            ],);

}
