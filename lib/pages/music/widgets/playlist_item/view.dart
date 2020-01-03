import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widget_common_playlist_view.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(PlaylistCenterItemState state, Dispatch dispatch, ViewService viewService) {
  return state.playlist== null?Container() : GridView.custom(
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, childAspectRatio: 0.74),
    childrenDelegate:
    SliverChildBuilderDelegate((context, index) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
//          Fluttertoast.showToast(msg: 'sss${state.playlist.playlists[index].copywriter}');
          Navigator.of(context).pushNamed('playlist_detail_page',arguments: {'id':state.playlist.playlists[index].id.toString(),'copywriter':state.playlist.playlists[index].copywriter!=null?state.playlist.playlists[index].copywriter:''});
        },
        child: CommonPlaylistView(
          width: 100,
          height: 100,
          path:
          state.playlist.playlists[index].coverImgUrl,
          title: state.playlist.playlists[index].name,
          count: state.playlist.playlists[index].playCount,
        ),
      );
    }, childCount: state.playlist.playlists.length),
  );
}
