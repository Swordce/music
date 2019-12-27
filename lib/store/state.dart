import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';

///全局播放状态
abstract class BaseGlobalState {
  bool isPlaying; //播放状态，true-->正在播放,false-->暂停
  bool showPlayView; //底部播放控件是否展示
  double playProgress; //当前歌曲播放进度
  int currentIndex; //当前播放的歌曲
  int startIndex = -1; //播放控件起始位置
  String currentPlaylistId; //当前播放的歌单
  MusicModel globalMusic; //当前播放的音乐列表
  AudioPlayer audioPlayer;
  SwiperController swiperController;
}

class GlobalState implements BaseGlobalState, Cloneable<GlobalState> {
  @override
  bool showPlayView = false;

  @override
  bool isPlaying = false;

  @override
  double playProgress = 0.0;

  @override
  int currentIndex = 0;

  @override
  String currentPlaylistId = '';

  @override
  MusicModel globalMusic;

  @override
  GlobalState clone() {
    // TODO: implement clone
    return GlobalState()
      ..currentPlaylistId = currentPlaylistId
      ..showPlayView = showPlayView
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..globalMusic = globalMusic
      ..audioPlayer = audioPlayer
      ..currentIndex = currentIndex
      ..swiperController = swiperController
      ..startIndex = startIndex;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  SwiperController swiperController;

  @override
  int startIndex = 0;
}
