import 'package:fish_redux/fish_redux.dart';

import 'adapter/item/state.dart';
//TODO replace with your own action
enum HomeAction { action,initData }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onInitAction(List<HomePageItemState> items) {
    return Action(HomeAction.initData, payload: items);
  }
}
