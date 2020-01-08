import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/src/swiper_controller.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_category_entity.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_entity.dart';
import 'package:music/store/state.dart';

class PlaylistCenterState
    implements Cloneable<PlaylistCenterState>, BaseGlobalState {
  TabController tabController;
  ScrollController scrollController;
  List<PlaylistCenterTags> playlistCenterTags;
  PlaylistCenterEntity playlist;
  String bgUrl;

  @override
  PlaylistCenterState clone() {
    return PlaylistCenterState()
      ..isInitSwiperIndex = isInitSwiperIndex
      ..pageIndex = pageIndex
      ..swiperStartIndex = swiperStartIndex
      ..bgUrl = bgUrl
      ..playlist = playlist
      ..playlistCenterTags = playlistCenterTags
      ..scrollController = scrollController
      ..tabController = tabController
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

PlaylistCenterState initState(Map<String, dynamic> args) {
  return PlaylistCenterState();
}
