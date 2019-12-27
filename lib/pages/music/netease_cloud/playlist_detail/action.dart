import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlaylistDetailAction { action,startIndex,loadPlayList,changeMusic,loadMusicUrl,updateIndex,updateMusicPlayList }

class PlaylistDetailActionCreator {
  static Action onAction() {
    return const Action(PlaylistDetailAction.action);
  }

  static Action onStartIndex(index) {
    return Action(PlaylistDetailAction.startIndex,payload: index);
  }

  static Action onLoadPlayList(playlist) {
    return Action(PlaylistDetailAction.loadPlayList,payload: playlist);
  }

  //更新正在播放的歌曲
  static Action onChangeMusic(map) {
    return Action(PlaylistDetailAction.changeMusic,payload: map);
  }

  static Action onLoadMusicUrl(id) {
    return Action(PlaylistDetailAction.loadMusicUrl,payload: id);
  }

  static Action onUpdateMusicPlayList(playlist) {
    return Action(PlaylistDetailAction.updateMusicPlayList,payload: playlist);
  }

  static Action onUpdateIndex(index) {
    return Action(PlaylistDetailAction.updateIndex,payload: index);
  }


}
