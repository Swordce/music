import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeState implements Cloneable<HomeState> {
  TabController tabController;
  List<TabModel> tabModels;

  @override
  HomeState clone() {
    return HomeState()
      ..tabController = tabController
      ..tabModels = tabModels;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

class TabModel {
  IconData tabIcon;
  String title;

  TabModel({this.tabIcon, this.title});
}
