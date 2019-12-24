import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/netease_cloud/widgets/play_list_detail_list.dart';
import 'package:music/pages/music/netease_cloud/widgets/widget_play_list_app_bar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlayListState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: state.detailPlaylist == null
        ? Container()
        : CustomScrollView(
            slivers: <Widget>[
              PlayListAppBarWidget(
                expandedHeight: 340,
                sigma: 40,
                backgroundImg: state.detailPlaylist.coverImgUrl,
                playCount: state.detailPlaylist.playCount,
                title: state.detailPlaylist.name,
                avatar: state.detailPlaylist.creator.avatarUrl,
                nickName: state.detailPlaylist.creator.nickname,
                description: state.detailPlaylist.description,
                commentCount: state.detailPlaylist.commentCount,
                shareCount: state.detailPlaylist.shareCount,
                musicCount: state.detailPlaylist.trackCount,
              ),
              new SliverFixedExtentList(
                itemExtent: 55.0,
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => PlayListDetailList(index: index+1,
                      musicName: state.detailPlaylist.tracks[index].name,
                      musicSoner:state.detailPlaylist.tracks[index].ar[0].name+'-' + state.detailPlaylist.tracks[index].al.name),
                  childCount: state.detailPlaylist.tracks.length,
                ),
              ),
            ],
          ),
  );
}
