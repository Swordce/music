import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/netease_cloud/home/action.dart';
import 'package:music/pages/music/widgets/common_swiper/page.dart';
import 'package:music/pages/music/widgets/widget_quick_entrance_view.dart';
import 'package:music/pages/music/widgets/widget_recommend_playlist_view.dart';
import 'package:music/widgets/keepalive_widget.dart';
import 'package:music/widgets/line.dart';

import 'state.dart';

Widget buildView(NeteaseState state, Dispatch dispatch, ViewService viewService) {
  return keepAliveWrapper(Container(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(viewService.context).size.width,
            height: 140,
            margin: EdgeInsets.fromLTRB(15, 20, 15, 25),
            child: state.bannerList == null? Container() : HomeSwiperPage().buildPage({'homeBanner':state.bannerList}),
          ),
          state.map == null?Container():GridView.custom(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.map.length,
              childAspectRatio: 1 / 0.8,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  switch (index) {
                    case 1:
                      dispatch(NeteaseActionCreator.onJumpToPlaylistCenter());
                      break;
                    case 2:
                      dispatch(NeteaseActionCreator.onJumpToRankPage());
                      break;
                    default:
                      Fluttertoast.showToast(msg: state.keys[index]);
                      break;
                  }
                },
                child: QuickEntranceView(
                  iconPath: state.map[state.keys[index]],
                  title: state.keys[index],
                ),
              );
            }, childCount: state.keys != null?state.keys.length:0),
          ),
          DefaultLineView(),
          RecommentPlaylistView(playlist: state.recommendList,dispatch: dispatch,),
        ],
      ),
    )
  ));
}
