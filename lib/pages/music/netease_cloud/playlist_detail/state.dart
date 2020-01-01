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
  int initMusicIndex; //初始化swiper的index
  int pageIndex = 0;
  bool isInitWidget = true;
  int playingIndex = 0;

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
      ..playingIndex = playingIndex
      ..isInitWidget = isInitWidget
      ..initMusicIndex = initMusicIndex
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
    ..duration = duration;
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
}

PlaylistDetailState initState(Map<String, dynamic> args) {
  PlaylistDetailState state = PlaylistDetailState();
  state.playlistId = args['id'];
  state.copywriter = args['copywriter'];
  return state;
}
