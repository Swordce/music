import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WelfareAction { action }

class WelfareActionCreator {
  static Action onAction() {
    return const Action(WelfareAction.action);
  }
}
