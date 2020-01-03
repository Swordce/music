import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';

///全局状态
abstract class BaseGlobalState {
  static const int PLAING_ORDER = 0;
  static final int PLAYING_RANDOM = 1;
  static final int PLAYING_CYCLE = 2;

  //播放音乐相关
  AudioPlayer audioPlayer;
  SwiperController swiperController;
  int currentPlayingStyle; //音乐播放模式---顺序、随机、单曲循环
  bool isPlaying; //播放状态，true-->正在播放,false-->暂停
  bool showPlayView; //底部播放控件是否展示
  double playProgress; //当前歌曲播放进度
  int playTime; //当前播放时间
  int duration; //歌曲时间
  int currentIndex; //当前播放的歌曲
  String currentPlaylistId; //当前播放的歌单
  MusicModel globalMusic; //当前播放的音乐列表

  //播放控件解耦,需要在页面中进行初始化
  bool isInitSwiperIndex; //是否初始化了swiper,用来设置swiper的index
  bool isBackToMain; //是否回到主界面，用于自动播放和播放界面更改上下曲
  int pageIndex; //swiper可控index
  int swiperStartIndex; //swiper初始index

  //歌单广场切换tab更改背景
  String bgImageUrl; //首次初始化调用,tab切换完数据未初始化完成,故需要此参数
  List<String> playlistCenterBgImageUrl;
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
    return GlobalState()
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
      ..isBackToMain = isBackToMain;
  }

  @override
  AudioPlayer audioPlayer;

  @override
  SwiperController swiperController;

  @override
  int currentPlayingStyle = BaseGlobalState.PLAING_ORDER;

  @override
  int duration;

  @override
  int playTime;

  @override
  List<String> playlistCenterBgImageUrl = [];

  @override
  String bgImageUrl = '';

  @override
  bool isInitSwiperIndex = true;

  @override
  int pageIndex = 0;

  @override
  int swiperStartIndex = 0;

  @override
  bool isBackToMain = true;
}
