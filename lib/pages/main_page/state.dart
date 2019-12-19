import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class MainPageState implements Cloneable<MainPageState> {
  int selectIndex = 0;
  List<Widget> pages;

  @override
  MainPageState clone() {
    return MainPageState()
      ..pages = pages
      ..selectIndex = selectIndex;
  }
}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState()..pages = args['pages'];
}
