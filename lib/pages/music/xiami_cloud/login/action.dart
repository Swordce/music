import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum XiamiLoginAction { action }

class XiamiLoginActionCreator {
  static Action onAction() {
    return const Action(XiamiLoginAction.action);
  }
}
