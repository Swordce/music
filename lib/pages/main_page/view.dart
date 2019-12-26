import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/actions/Adapt.dart';
import 'package:music/widgets/keepalive_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MainPageState state, Dispatch dispatch, ViewService viewService) {
  return Builder(
    builder: (context) {
      Adapt.initContext(context);
      final pageController = PageController();

      Widget _buildPage(Widget page) {
        return KeepAliveWidget(page);
      }

      return Scaffold(
          body: PageView(
            physics: ClampingScrollPhysics(),
            children: state.pages.map(_buildPage).toList(),
            controller: pageController,
            onPageChanged: (int i) =>
                dispatch(MainPageActionCreator.onTabChanged(i)),
          ),
          bottomNavigationBar: Container(
              height: 60,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(IconData(0xe642, fontFamily: 'tabIcons'),
                              size: Adapt.px(44)),
                          title: Text('音乐'),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(IconData(0xe61d, fontFamily: 'tabIcons'),
                              size: Adapt.px(44)),
                          title: Text('视频'),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            IconData(0xe61d, fontFamily: 'tabIcons'),
                            size: Adapt.px(44),
                            color: Colors.white,
                          ),
                          title: Text(''),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(IconData(0xe628, fontFamily: 'tabIcons'),
                              size: Adapt.px(44)),
                          title: Text('小说'),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            IconData(0xe62e, fontFamily: 'tabIcons'),
                            size: Adapt.px(44),
                          ),
                          title: Text('我的'),
                        ),
                      ],
                      currentIndex: state.selectIndex,
                      selectedItemColor: Colors.red,
                      unselectedItemColor: Colors.black,
                      onTap: (int index) {
                        if(index != 2) {
                          pageController.jumpToPage(index);
                        }
                      },
                      type: BottomNavigationBarType.fixed,
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: RotationTransition(
                          alignment: Alignment.center,
                          turns: state.animationController,
                          child:CircleAvatar(
                            backgroundImage: NetworkImage(state.globalMusic == null
                                ? 'http://p1.music.126.net/rQ72PIOhMUosTrFcH0j8uQ==/109951164106511339.jpg'
                                : state.globalMusic.musicList[state.currentIndex].musicImgUrl),
                            radius: 25,
                          ),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              )));
    },
  );
}
