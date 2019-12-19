import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MusicState> buildReducer() {
  return asReducer(
    <Object, Reducer<MusicState>>{
      MusicAction.action: _onAction,
      MusicAction.initSwiper:_initSwiper,
      MusicAction.initEntrance:_initEntrance,
      MusicAction.initPlayList:_initPlayList
    },
  );
}

MusicState _onAction(MusicState state, Action action) {
  final MusicState newState = state.clone();
  return newState;
}

MusicState _initSwiper(MusicState state,Action action) {
  final MusicState musicState = state.clone();
  musicState.bannerList = action.payload;
  return musicState;
}

MusicState _initEntrance(MusicState state,Action action) {
  final MusicState musicState = state.clone();
  musicState.map = {
    '每日推荐': 'assets/images/icon_daily.png',
    '歌单': 'assets/images/icon_playlist.png',
    '排行榜': 'assets/images/icon_rank.png',
    '电台': 'assets/images/icon_radio.png',
  };
  musicState.keys = musicState.map.keys.toList();
  return musicState;
}

MusicState _initPlayList(MusicState state,Action action) {
  final MusicState musicState = state.clone();
  musicState.recommendList = action.payload;
  return musicState;
}
