import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action ;

import 'state.dart';
//TODO replace with your own action
enum HomeAction { action,initData,changeTab }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }


  static Action onChangeTab(Map<String,Object> tab) {
    return Action(HomeAction.changeTab,payload: tab);
  }
}
