import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/store/state.dart';

class MainPageState implements Cloneable<MainPageState>, BaseGlobalState {
  int selectIndex = 0;
  List<Widget> pages;

  @override
  bool showPlayView;

  @override
  bool isPlaying;

  @override
  double playProgress;

  AnimationController animationController;

  @override
  MusicModel globalMusic;

  @override
  int currentIndex;

  @override
  String currentPlaylistId;

  @override
  MainPageState clone() {
    return MainPageState()
      ..pages = pages
      ..animationController = animationController
      ..selectIndex = selectIndex
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..showPlayView = showPlayView
      ..currentIndex = currentIndex
      ..globalMusic = globalMusic
      ..currentPlaylistId = currentPlaylistId
      ..swiperController = swiperController
      ..audioPlayer = audioPlayer;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  SwiperController swiperController;

}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState()..pages = args['pages'];
}
