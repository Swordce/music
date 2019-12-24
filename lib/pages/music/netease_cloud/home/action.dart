import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NeteaseAction { action,jumpToPlayList }

class NeteaseActionCreator {
  static Action onAction() {
    return const Action(NeteaseAction.action);
  }


  static Action onJumpToPlayList(String playId) {
    return  Action(NeteaseAction.jumpToPlayList,payload: playId);
  }

}
