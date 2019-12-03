import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _initData,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _initData(Action action, Context<HomeState> ctx) {
  List<TabModel> list = new List();
  list.add(TabModel(tabIcon: Icons.home,title: '云音乐'));
  list.add(TabModel(tabIcon: Icons.home,title: 'QQ音乐'));
  list.add(TabModel(tabIcon: Icons.home,title: '酷狗音乐'));
  list.add(TabModel(tabIcon: Icons.home,title: '虾米音乐'));

  final TickerProvider tickerProvider = ctx.stfState  as TickerProvider;
  var _controller =TabController(vsync: tickerProvider,length: list.length);
  ctx.dispatch(HomeActionCreator.onChangeTab({'tablist':list,'controller':_controller}));
}
