import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/src/swiper_controller.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/state.dart';
import 'package:music/pages/music/state.dart';
import 'package:music/pages/music/widgets/playlist_center/state.dart';
import 'package:music/store/state.dart';

class CommonPlaylistState
    implements Cloneable<CommonPlaylistState>, BaseGlobalState {

  @override
  CommonPlaylistState clone() {
    return CommonPlaylistState();
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

  @override
  List<String> playlistCenterBgImageUrl;

  @override
  String bgImageUrl;

  @override
  bool isInitSwiperIndex;

  @override
  int pageIndex;

  @override
  int swiperStartIndex;

  @override
  bool isBackToMain;
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
    newState.currentPlayingStyle = state.currentPlayingStyle;
    newState.playTime = state.playTime;
    newState.duration = state.duration;
    newState.bgImageUrl = state.bgImageUrl;
    newState.playlistCenterBgImageUrl = state.playlistCenterBgImageUrl;
    newState.isInitSwiperIndex = state.isInitSwiperIndex;
    newState.pageIndex = state.pageIndex;
    newState.swiperStartIndex = state.swiperStartIndex;
    newState.isBackToMain = state.isBackToMain;
    return newState;
  }
}

class CommonPlaylistConnector2
    extends ConnOp<PlaylistCenterState, CommonPlaylistState> {
  @override
  CommonPlaylistState get(PlaylistCenterState state) {
    CommonPlaylistState newState = new CommonPlaylistState();
    newState.isPlaying = state.isPlaying;
    newState.audioPlayer = state.audioPlayer;
    newState.currentIndex = state.currentIndex;
    newState.globalMusic = state.globalMusic;
    newState.playProgress = state.playProgress;
    newState.showPlayView = state.showPlayView;
    newState.swiperController = state.swiperController;
    newState.currentPlayingStyle = state.currentPlayingStyle;
    newState.playTime = state.playTime;
    newState.duration = state.duration;
    newState.bgImageUrl = state.bgImageUrl;
    newState.playlistCenterBgImageUrl = state.playlistCenterBgImageUrl;
    newState.isInitSwiperIndex = state.isInitSwiperIndex;
    newState.pageIndex = state.pageIndex;
    newState.swiperStartIndex = state.swiperStartIndex;
    newState.isBackToMain = state.isBackToMain;
    return newState;
  }
}