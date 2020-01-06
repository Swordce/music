import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/src/swiper_controller.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/model/common_rank_model.dart';
import 'package:music/store/state.dart';

class RankState implements Cloneable<RankState>, BaseGlobalState {
  List<CommonRankModel> rankModels;
  List<CommonRankModel> moreRankModels;

  @override
  RankState clone() {
    return RankState()
      ..bgImageUrl = bgImageUrl
      ..playlistCenterBgImageUrl = playlistCenterBgImageUrl
      ..currentPlaylistId = currentPlaylistId
      ..showPlayView = showPlayView
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..globalMusic = globalMusic
      ..audioPlayer = audioPlayer
      ..currentIndex = currentIndex
      ..currentPlayingStyle = currentPlayingStyle
      ..swiperController = swiperController
      ..duration = duration
      ..playTime = playTime
      ..isInitSwiperIndex = isInitSwiperIndex
      ..pageIndex = pageIndex
      ..swiperStartIndex = swiperStartIndex
      ..isBackToMain = isBackToMain
      ..rankModels = rankModels
      ..moreRankModels = moreRankModels;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  String bgImageUrl;

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
  bool isBackToMain;

  @override
  bool isInitSwiperIndex;

  @override
  bool isPlaying;

  @override
  int pageIndex;

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
  int swiperStartIndex;
}

RankState initState(Map<String, dynamic> args) {
  return RankState();
}
