import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/store/state.dart';

class PlaylistDetailState implements Cloneable<PlaylistDetailState>, BaseGlobalState {
  String playlistId; //歌单id
  String copywriter; //歌单副标题
  MusicModel music;
  SwiperController swiperController;

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
      ..swiperController = swiperController
      ..playlistId = playlistId
      ..copywriter = copywriter
      ..music = music
      ..isPlaying = isPlaying
      ..playProgress = playProgress
      ..showPlayView = showPlayView
      ..currentIndex = currentIndex
      ..globalMusic = globalMusic
      ..currentPlaylistId = currentPlaylistId;
  }
}

PlaylistDetailState initState(Map<String, dynamic> args) {
  PlaylistDetailState state = PlaylistDetailState();
  state.playlistId = args['id'];
  state.copywriter = args['copywriter'];
  return state;
}
