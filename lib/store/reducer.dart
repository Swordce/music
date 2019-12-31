import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_music_model.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeMusic: _onChangeMusic,
      GlobalAction.loadMusicUrl: _onLoadMusicUrl,
      GlobalAction.loadPlayList: _onLoadPlayList,
      GlobalAction.updateCurrentPage:_onUpdateCurrentPage,
      GlobalAction.updateProgress:_onUpdateProgress,
      GlobalAction.updateAudioPlayer:_onUpdateAudioPlayer,
      GlobalAction.updatePlayStatus:_onUpdatePlayStatus,
      GlobalAction.initStartIndex:_onInitStartIndex,
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
  newState.playProgress = 0;
  newState.currentIndex = index;
  newState.currentPlaylistId = action.payload['currentPlaylistId'];
  return newState;
}

GlobalState _onInitStartIndex(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.isPlaying = true;
  newState.playProgress = 0.0;
  return newState;
}

GlobalState _onUpdateCurrentPage(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  int index = action.payload['index'];
  newState.currentIndex = index;
  return newState;
}

GlobalState _onUpdateProgress(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var progress = action.payload['playProgress'];
  newState.playProgress = progress;
  return newState;
}

GlobalState _onUpdateAudioPlayer(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var audioPlayer = action.payload['audioPlayer'];
  var swiperController = action.payload['swiperController'];
  newState.audioPlayer = audioPlayer;
  newState.swiperController = swiperController;
  return newState;
}

GlobalState _onUpdatePlayStatus(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var status = action.payload['isPlaying'];
  newState.isPlaying = status;
  return newState;
}
