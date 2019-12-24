import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayListAction { action,loadPlayList }

class PlayListActionCreator {
  static Action onAction() {
    return const Action(PlayListAction.action);
  }

  static Action onLoadPlayList(playlist) {
    return Action(PlayListAction.loadPlayList,payload: playlist);
  }
}
