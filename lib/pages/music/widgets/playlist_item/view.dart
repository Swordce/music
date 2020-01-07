import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget_common_playlist_view.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    PlaylistCenterItemState state, Dispatch dispatch, ViewService viewService) {
  return state.playlist == null
      ? Container()
      : SmartRefresher(
          controller: state.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: (){
            dispatch(PlaylistCenterItemActionCreator.onRefresh());
          },
          onLoading: (){
            dispatch(PlaylistCenterItemActionCreator.onLoadMore());
          },
          child: GridView.custom(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.74),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('playlist_detail_page', arguments: {
                    'id': state.playlist[index].id.toString(),
                    'copywriter':
                        state.playlist[index].copywriter != null
                            ? state.playlist[index].copywriter
                            : ''
                  });
                },
                child: CommonPlaylistView(
                  width: 100,
                  height: 100,
                  path: state.playlist[index].coverImgUrl,
                  title: state.playlist[index].name,
                  count: state.playlist[index].playCount,
                ),
              );
            }, childCount: state.playlist.length),
          ),
        );
}
