import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/netease_cloud/widgets/widget_play_list_app_bar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlayListState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        PlayListAppBarWidget(
          expandedHeight: 340,
          backgroundImg: 'assets/images/test.jpg',
          title: '1111',
          sigma: 40,
          count: 100,
          id:state.playListId,
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (context, index) => new ListTile(
              title: new Text("Item $index"),
            ),
            childCount: 30,
          ),
        ),
      ],
    ),
  );
}
