import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NeteaseAction { action,jumpToPlayList,jumpToPlaylistCenter,jumpToRankPage }

class NeteaseActionCreator {
  static Action onAction() {
    return const Action(NeteaseAction.action);
  }


  static Action onJumpToPlayList(playlistInfo) {
    return  Action(NeteaseAction.jumpToPlayList,payload: playlistInfo);
  }

  static Action onJumpToPlaylistCenter() {
    return  Action(NeteaseAction.jumpToPlaylistCenter);
  }

  static Action onJumpToRankPage() {
    return  Action(NeteaseAction.jumpToRankPage);
  }

}
