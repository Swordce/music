import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/widgets/common_playlist_center_item/page.dart';
import 'package:music/widgets/keepalive_widget.dart';

import 'state.dart';

Widget buildView(
    PlaylistCenterState state, Dispatch dispatch, ViewService viewService) {
  return Stack(
    children: <Widget>[
      CachedNetworkImage(
        imageUrl: (state.bgImageUrl == null && state.bgUrl == null)
            ? 'https://p2.music.126.net/2yV7awHozWl6l4I6hHdevw==/109951164478650119.jpg'
            : state.bgUrl == null ? state.bgImageUrl : state.bgUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 50,
          sigmaX: 50,
        ),
        child: Container(
          color: Colors.white54,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      state.playlistCenterTags == null
          ? Container()
          : Stack(
        children: <Widget>[
          Padding(
            padding: !state.showPlayView
                ? EdgeInsets.only(bottom: 0)
                : EdgeInsets.only(bottom: 60),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(viewService.context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                  titleSpacing: 0,
                  title: Text(
                    '歌单广场',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    controller: state.tabController,
                    labelColor: Colors.red,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.black54,
                    labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    tabs: state.playlistCenterTags.map((tags) {
                      return Tab(text: tags.name);
                    }).toList(),
                    //onTap: (index) => dispatch(SeasonLinkPageActionCreator.getSeasonDetial(_season[index])),
                  )),
              body: state.playlistCenterTags == null
                  ? Container()
                  : TabBarView(
                  controller: state.tabController,
                  children: state.playlistCenterTags.map((tags) {
                    return keepAliveWrapper(PlaylistCenterItemPage()
                        .buildPage({'tag': tags.name}));
                  }).toList()),
            ),
          ),
          Visibility(
              visible: state.showPlayView,
              child: Container(
                child: viewService.buildComponent('global_play_view'),
              )
          )
        ],
      ),

    ],
  );
}
