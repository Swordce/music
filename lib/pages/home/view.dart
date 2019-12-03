import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/netease_cloud/music/page.dart';
import 'package:music/pages/netease_cloud/welfare/page.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.red,
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.black,
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Music',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: state.tabController,
          isScrollable: false,
          indicatorColor: Colors.red,
          indicatorWeight: 2,
          indicatorSize:TabBarIndicatorSize.label,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          tabs: state.tabModels.map((TabModel model) {
            return Tab(
              text: model.title,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: state.tabController,
        children: <Widget>[
          MusicPage().buildPage(null),
          WelfarePage().buildPage(null),
          MusicPage().buildPage(null),
          WelfarePage().buildPage(null),
        ],
      ));
}
