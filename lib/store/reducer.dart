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
      GlobalAction.updatePlayingStyle:_onUpdatePlayingStyle,
      GlobalAction.updatePlaylistCenterBgImageUrl:_onPlaylistCenterBgImageUrl,
      GlobalAction.initSwiperIndex: _onInitSwiperIndex,
      GlobalAction.isInitWidget: _onIsInitWidget,
      GlobalAction.isBackToMain: _onIsBackToMain,
    },
  );
}

//是否回到主页，判断是否含有swiper,swiperController是否生效
GlobalState _onIsBackToMain(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.isBackToMain = action.payload;
  return newState;
}

//swiper滑动更改pageIndex
GlobalState _onIsInitWidget(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.isInitSwiperIndex = action.payload['isInitWidget'];
  newState.pageIndex = action.payload['pageIndex'];
  newState.playProgress = 0.0;
  return newState;
}

//进入页面初始化swiperIndex
GlobalState _onInitSwiperIndex(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.swiperStartIndex = action.payload;
  return newState;
}


//加载播放列表
GlobalState _onLoadPlayList(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.globalMusic = action.payload;
  return newState;
}

//更改当前歌曲的url
GlobalState _onLoadMusicUrl(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  int index = action.payload['index'];
  newState.globalMusic.musicList[index].musicUrl = action.payload['musicUrl'];
  newState.currentIndex = index;
  return newState;
}

//更改当前播放歌曲
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

//点击歌单列表播放歌曲
GlobalState _onInitStartIndex(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.isPlaying = true;
  newState.playProgress = 0.0;
  return newState;
}

//更改当前播放的下标
GlobalState _onUpdateCurrentPage(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  int index = action.payload['index'];
  newState.currentIndex = index;
  return newState;
}

//更新进度条
GlobalState _onUpdateProgress(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var progress = action.payload['playProgress'];
  newState.playProgress = progress;
  newState.playTime = action.payload['playTime'];
  newState.duration = action.payload['duration'];
  return newState;
}

//初始化播放器和swiper
GlobalState _onUpdateAudioPlayer(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var audioPlayer = action.payload['audioPlayer'];
  var swiperController = action.payload['swiperController'];
  newState.audioPlayer = audioPlayer;
  newState.swiperController = swiperController;
  return newState;
}

//更新播放状态
GlobalState _onUpdatePlayStatus(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var status = action.payload['isPlaying'];
  newState.isPlaying = status;
  return newState;
}

//更新播放模式
GlobalState _onUpdatePlayingStyle(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var status = action.payload;
  newState.currentPlayingStyle = status;
  return newState;
}

//更改歌单广场背景
GlobalState _onPlaylistCenterBgImageUrl(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  var url = action.payload;
  newState.bgImageUrl = url;
  newState.playlistCenterBgImageUrl.add(url);
  return newState;
}