import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/actions/Adapt.dart';
import 'package:music/widgets/keepalive_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainPageState state, Dispatch dispatch, ViewService viewService) {
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe642,fontFamily: 'tabIcons'), size: Adapt.px(44)),
              title: Text('音乐'),
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe61d,fontFamily: 'tabIcons'), size: Adapt.px(44)),
              title: Text('视频'),
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe628,fontFamily: 'tabIcons'), size: Adapt.px(44)),
              title: Text('小说'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe62e,fontFamily: 'tabIcons'),
                size: Adapt.px(44),
              ),
              title: Text('我的'),
            ),
          ],
          currentIndex: state.selectIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: (int index) {
            pageController.jumpToPage(index);
          },
          type: BottomNavigationBarType.fixed,
        ),
      );
    },
  );
}
