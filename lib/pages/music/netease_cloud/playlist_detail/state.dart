import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/store/state.dart';

class PlaylistDetailState
    implements Cloneable<PlaylistDetailState>, BaseGlobalState {
  String playlistId; //歌单id
  String copywriter; //歌单副标题
  MusicModel music;

  @override
  bool showPlayView;

  @override
  bool isPlaying;
  @override
  double playProgress;

  @override
  MusicModel globalMusic;

  @override
  int currentIndex;

  @override
  String currentPlaylistId;

  @override
  PlaylistDetailState clone() {
    return PlaylistDetailState()
      ..pageIndex = pageIndex
      ..isInitSwiperIndex = isInitSwiperIndex
      ..swiperStartIndex = swiperStartIndex
      ..swiperController = swiperController
      ..playlistId = playlistId
      ..copywriter = copywriter
      ..music = music
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..showPlayView = showPlayView
      ..currentIndex = currentIndex
      ..globalMusic = globalMusic
      ..currentPlaylistId = currentPlaylistId
      ..audioPlayer = audioPlayer
      ..currentPlayingStyle = currentPlayingStyle
      ..playTime = playTime
      ..duration = duration
      ..playlistCenterBgImageUrl = playlistCenterBgImageUrl
      ..bgImageUrl = bgImageUrl
    ..isBackToMain = isBackToMain;
  }

  @override
  AudioPlayer audioPlayer;

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
  int swiperStartIndex;

  @override
  int pageIndex;

  @override
  bool isBackToMain;
}

PlaylistDetailState initState(Map<String, dynamic> args) {
  PlaylistDetailState state = PlaylistDetailState();
  state.playlistId = args['id'];
  if(args['copywriter'] != null) {
    state.copywriter = args['copywriter'];
  }
  return state;
}
