import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/store/state.dart';

class PlayingMusicState
    implements Cloneable<PlayingMusicState>, BaseGlobalState {
  AnimationController animationController;

  @override
  PlayingMusicState clone() {
    return PlayingMusicState()
      ..isInitSwiperIndex = isInitSwiperIndex
      ..pageIndex = pageIndex
      ..swiperStartIndex = swiperStartIndex
      ..playlistCenterBgImageUrl = playlistCenterBgImageUrl
      ..audioPlayer = audioPlayer
      ..currentIndex = currentIndex
      ..currentPlaylistId = currentPlaylistId
      ..globalMusic = globalMusic
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..showPlayView = showPlayView
      ..swiperController = swiperController
      ..animationController = animationController
      ..playTime = playTime
      ..duration = duration
      ..bgImageUrl = bgImageUrl
      ..isBackToMain = isBackToMain;
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

PlayingMusicState initState(Map<String, dynamic> args) {
  return PlayingMusicState();
}
