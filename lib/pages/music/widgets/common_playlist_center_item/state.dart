import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/src/swiper_controller.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_entity.dart';
import 'package:music/store/state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlaylistCenterItemState
    implements Cloneable<PlaylistCenterItemState>, BaseGlobalState {
  String tag;
  List<Playlists> playlist;
  RefreshController refreshController;
  int pageNum;
  int pageSize;
  int updateTime;

  @override
  PlaylistCenterItemState clone() {
    return PlaylistCenterItemState()
      ..updateTime = updateTime
      ..pageNum = pageNum
      ..pageSize = pageSize
      ..refreshController = refreshController
      ..isInitSwiperIndex = isInitSwiperIndex
      ..pageIndex = pageIndex
      ..swiperStartIndex = swiperStartIndex
      ..playlist = playlist
      ..tag = tag
      ..audioPlayer = audioPlayer
      ..currentIndex = currentIndex
      ..currentPlayingStyle = currentPlayingStyle
      ..currentPlaylistId = currentPlaylistId
      ..duration = duration
      ..globalMusic = globalMusic
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..playTime = playTime
      ..playlistCenterBgImageUrl = playlistCenterBgImageUrl
      ..showPlayView = showPlayView
      ..swiperController = swiperController
      ..bgImageUrl = bgImageUrl
      ..isBackToMain = isBackToMain;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  int currentIndex;

  @override
  int currentPlayingStyle;

  @override
  String currentPlaylistId;

  @override
  int duration;

  @override
  MusicModel globalMusic;

  @override
  bool isPlaying;

  @override
  double playProgress;

  @override
  int playTime;

  @override
  List<String> playlistCenterBgImageUrl;

  @override
  bool showPlayView;

  @override
  SwiperController swiperController;

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

PlaylistCenterItemState initState(Map<String, dynamic> args) {
  PlaylistCenterItemState newState = PlaylistCenterItemState();
  newState.tag = args['tag'];
  newState.pageSize = 15;
  newState.pageNum = 0;
  return newState;
}
