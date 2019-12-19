import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum QQLoginAction { action }

class QQLoginActionCreator {
  static Action onAction() {
    return const Action(QQLoginAction.action);
  }
}
