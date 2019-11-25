import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter homePageAdapter = viewService.buildAdapter();

  return Scaffold(
    appBar: AppBar(
      title: Text('首页'),
    ),
    body: Container(
      child: ListView.builder(
          itemBuilder: homePageAdapter.itemBuilder,
          itemCount: homePageAdapter.itemCount),
    ),
  );
}
