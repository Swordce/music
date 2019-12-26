import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/widgets/widget_playlist_detail_item_view.dart';
import 'package:music/pages/music/widgets/widget_global_bottom_play_view.dart';
import 'package:music/pages/music/widgets/widget_common_header.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlaylistDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: state.music == null
        ? Container(
            alignment: Alignment.center,
            child: Text('加载中...'),
          )
        : Stack(
            children: <Widget>[
              Padding(
                padding: !state.showPlayView
                    ? EdgeInsets.only(bottom: 0)
                    : EdgeInsets.only(bottom: 60),
                child: CustomScrollView(
                  slivers: <Widget>[
                    CommonPlaylistHeaderView(
                      dispatch: dispatch,
                      expandedHeight: 340,
                      sigma: 40,
                      copywriter: state.copywriter,
                      music: state.music,
                    ),
                    new SliverFixedExtentList(
                      itemExtent: 55.0,
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) => PlaylistDetailItemView(
                          dispatch: dispatch,
                          index: index,
                          currentPlaylistId: state.currentPlaylistId,
                          showPlayView: state.showPlayView,
                          music: state.music,
                        ),
                        childCount: state.music.musicList.length,
                      ),
                    ),
                  ],
                ),
              ),
              state.globalMusic == null
                  ? Container()
                  : Offstage(
                      offstage: !state.showPlayView,
                      child: GlobalBottomPlayView(
                        currentIndex: state.currentIndex,
                        playPercent: state.playProgress,
                        isPlaying: state.isPlaying,
                        globalMusic: state.globalMusic,
                        swiperController: state.swiperController,
                        dispatch: dispatch,
                      ),
                    )
            ],
          ),
  );
}
