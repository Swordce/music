import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayListAction { action }

class PlayListActionCreator {
  static Action onAction() {
    return const Action(PlayListAction.action);
  }
}
