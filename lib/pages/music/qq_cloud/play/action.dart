import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum QQMusicAction { action }

class QQMusicActionCreator {
  static Action onAction() {
    return const Action(QQMusicAction.action);
  }
}
