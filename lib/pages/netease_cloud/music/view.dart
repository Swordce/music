import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/netease_cloud/widgets/home_swiper/page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MusicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(viewService.context).size.width,
      height: 140,
      margin: EdgeInsets.fromLTRB(15,20,15,0),
      child: HomeSwiperPage().buildPage(null),
    ),
  );
}
