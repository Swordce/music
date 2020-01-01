import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/src/swiper_controller.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/state.dart';
import 'package:music/pages/music/state.dart';
import 'package:music/store/state.dart';

class CommonPlaylistState
    implements Cloneable<CommonPlaylistState>, BaseGlobalState {
  int initIndex;
  bool isInitWidget;
  int pageIndex;

  @override
  CommonPlaylistState clone() {
    return CommonPlaylistState()
      ..pageIndex = pageIndex
      ..isInitWidget = isInitWidget
      ..audioPlayer = audioPlayer
      ..currentIndex = currentIndex
      ..currentPlaylistId = currentPlaylistId
      ..globalMusic = globalMusic
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..showPlayView = showPlayView
      ..swiperController = swiperController
      ..currentPlayingStyle = currentPlayingStyle
      ..initIndex = initIndex;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  int currentIndex;

  @override
  String currentPlaylistId;

  @override
  MusicModel globalMusic;

  @override
  bool isPlaying;

  @override
  double playProgress;

  @override
  bool showPlayView;

  @override
  SwiperController swiperController;

  @override
  int currentPlayingStyle;

  @override
  int duration;

  @override
  int playTime;
}

class CommonPlaylistConnector
    extends ConnOp<PlaylistDetailState, CommonPlaylistState> {
  @override
  CommonPlaylistState get(PlaylistDetailState state) {
    CommonPlaylistState newState = new CommonPlaylistState();
    newState.isPlaying = state.isPlaying;
    newState.audioPlayer = state.audioPlayer;
    newState.currentIndex = state.currentIndex;
    newState.globalMusic = state.globalMusic;
    newState.playProgress = state.playProgress;
    newState.showPlayView = state.showPlayView;
    newState.swiperController = state.swiperController;
    newState.initIndex = state.initMusicIndex;
    newState.isInitWidget = state.isInitWidget;
    newState.pageIndex = state.pageIndex;
    newState.currentPlayingStyle = state.currentPlayingStyle;
    newState.playTime = state.playTime;
    newState.duration = state.duration;
    return newState;
  }
}
