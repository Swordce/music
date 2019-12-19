import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NeteaseAction { action,initEntrance }

class NeteaseActionCreator {
  static Action onAction() {
    return const Action(NeteaseAction.action);
  }

  static Action onInitEntrance(Map<String,Object> map) {
    return  Action(NeteaseAction.initEntrance,payload: map);
  }
}
