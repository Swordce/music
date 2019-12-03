import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicAction { action }

class MusicActionCreator {
  static Action onAction() {
    return const Action(MusicAction.action);
  }
}
