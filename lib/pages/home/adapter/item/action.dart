import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomePageItemAction { action }

class HomePageItemActionCreator {
  static Action onAction() {
    return const Action(HomePageItemAction.action);
  }
}
