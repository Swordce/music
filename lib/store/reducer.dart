import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeMusic: _onChangeMusic,
      GlobalAction.loadMusicUrl: _onLoadMusicUrl,
      GlobalAction.loadPlayList: _onLoadPlayList,
      GlobalAction.updateCurrentPage:_onUpdateCurrentPage
    },
  );
}

GlobalState _onLoadPlayList(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.globalMusic = action.payload;
  return newState;
}

GlobalState _onLoadMusicUrl(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  int index = action.payload['index'];
  newState.globalMusic.musicList[index].musicUrl = action.payload['musicUrl'];
  newState.currentIndex = index;
  return newState;
}

GlobalState _onChangeMusic(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var index = action.payload['index'];
  newState.showPlayView = action.payload['showPlayView'];
  newState.isPlaying = action.payload['isPlaying'];
  newState.currentIndex = index;
  return newState;
}

GlobalState _onUpdateCurrentPage(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  int index = action.payload['index'];
  newState.currentIndex = index;
  return newState;
}
