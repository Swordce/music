import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TestPageAction { action }

class TestPageActionCreator {
  static Action onAction() {
    return const Action(TestPageAction.action);
  }
}
