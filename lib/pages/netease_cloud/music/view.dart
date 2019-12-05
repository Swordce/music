import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/netease_cloud/widgets/home_swiper/page.dart';
import 'package:music/widgets/common_icon_text.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MusicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            height: 140,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 25),
            child: HomeSwiperPage().buildPage(null),
          ),
          GridView.custom(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.map.length,
              childAspectRatio: 1 / 1.1,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  switch (index) {
                  }
                },
                child: CommonIconText(
                  iconPath: state.map[state.keys[index]],
                  title: state.keys[index],
                ),
              );
            }, childCount: state.keys.length),
          ),
        ],
      ),
    )
  );
}
