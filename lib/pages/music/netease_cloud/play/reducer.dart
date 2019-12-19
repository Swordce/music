import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NeteaseState> buildReducer() {
  return asReducer(
    <Object, Reducer<NeteaseState>>{
      NeteaseAction.action: _onAction,
      NeteaseAction.initEntrance:_initEntrance,
    },
  );
}

NeteaseState _onAction(NeteaseState state, Action action) {
  final NeteaseState newState = state.clone();
  return newState;
}

NeteaseState _initEntrance(NeteaseState state,Action action) {
  final NeteaseState musicState = state.clone();
  musicState.map = {
    '每日推荐': 'images/icon_daily.png',
    '歌单': 'images/icon_playlist.png',
    '排行榜': 'images/icon_rank.png',
    '电台': 'images/icon_radio.png',
  };
  musicState.keys = musicState.map.keys.toList();
  musicState.bannerList = action.payload['banner'];
  musicState.recommendList = action.payload['playlist'];
  return musicState;
}

