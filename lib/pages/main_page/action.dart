import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainPageAction { action,tabChanged }

class MainPageActionCreator {
  static Action onAction() {
    return const Action(MainPageAction.action);
  }

  static Action onTabChanged(int index) {
    return Action(MainPageAction.tabChanged,payload: index);
  }
}
