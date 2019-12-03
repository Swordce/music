import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HomeSwiperState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 50,
    child: state.bannerList==null?Container(): Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            state.bannerList[index].pic,
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: state.bannerList.length,
      autoplay: true,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black38,
            activeColor: Colors.red,
          )),
    ),
  );
}
