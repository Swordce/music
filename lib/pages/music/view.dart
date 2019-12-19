import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MusicState state, Dispatch dispatch, ViewService viewService) {
  return Builder(builder: (context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.black87,
                labelColor: Colors.red,
                tabs: <Widget>[
                  Tab(
                    child: Text('云音乐',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  Tab(
                    child: Text('QQ音乐',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  Tab(
                    child: Text('虾米音乐',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
//            physics: NeverScrollableScrollPhysics(),//禁止滑动
            children: <Widget>[
              viewService.buildComponent('netease_music'),
              viewService.buildComponent('qq_music'),
              viewService.buildComponent('xiami_music'),
            ],
          )),
    );
  });
}
