import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_music_model.dart';

enum GlobalAction { initStartIndex,changeMusic,loadPlayList,loadMusicUrl,updateMusicUrl,updatePlayStatus,updateProgress,updateLrc,updateCurrentPage,updateAudioPlayer }

class GlobalActionCreator {

  static Action onLoadPlayList(MusicModel playlist) {
    return  Action(GlobalAction.loadPlayList,payload: playlist);
  }

  static Action onInitStartIndex(index) {
    return  Action(GlobalAction.initStartIndex,payload: index);
  }

  static Action onChangeMusic(music) {
    return  Action(GlobalAction.changeMusic,payload: music);
  }

  static Action onLoadMusicUrl(url) {
    return  Action(GlobalAction.loadMusicUrl,payload: url);
  }

  static Action onUpdateMusicUrl(url) {
    return  Action(GlobalAction.updateMusicUrl,payload: url);
  }

  static Action onUpdatePlayStatus(status) {
    return  Action(GlobalAction.updatePlayStatus,payload: status);
  }

  static Action onUpdateProgress(progress) {
    return  Action(GlobalAction.updateProgress,payload: progress);
  }

  static Action onUpdateLrc(lrc) {
    return  Action(GlobalAction.updateLrc,payload: lrc);
  }

  static Action onUpdateCurrentPage(index) {
    return  Action(GlobalAction.updateCurrentPage,payload: index);
  }

  static Action updateAudioPlayer(audioPlayer) {
    return  Action(GlobalAction.updateAudioPlayer,payload: audioPlayer);
  }
}