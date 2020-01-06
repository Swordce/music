import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/widgets/flexible_sliverappbar_detail_view.dart';
import 'package:music/pages/music/widgets/widget_common_playlist_view.dart';
import 'package:music/pages/music/widgets/widget_common_header_bottom.dart';

class CommonPlaylistHeaderView extends StatelessWidget {
  final double expandedHeight;
  final double sigma;
  final String copywriter;
  final MusicModel music;
  final Dispatch dispatch;
  final AudioPlayer audioPlayer;
  final bool showBottoView;

  CommonPlaylistHeaderView(
      {Key key,
      this.expandedHeight,
      this.sigma,
      this.copywriter,
      this.music,
      this.dispatch,
      this.audioPlayer,
      this.showBottoView})
      : super(key: key);

  Widget _buildHeader(String path, int count) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 80),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CommonPlaylistView(
                width: 120,
                height: 120,
                path: music.coverImgUrl,
                count: count,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      width: 180,
                      child: Text(music.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(music.avatarUrl),
                          radius: 12,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 120),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(music.nickname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(maxWidth: 120),
                              margin: EdgeInsets.only(right: 20),
                              child: Text(music.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12)),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                _buildHeaderItem('assets/images/icon_comment.png',
                    music.commentCount.toString()),
                _buildHeaderItem('assets/images/icon_share.png',
                    music.shareCount.toString()),
                _buildHeaderItem('assets/images/icon_download.png', '下载'),
                _buildHeaderItem('assets/images/icon_multi_select.png', '多选'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String imgPath, String name) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Image.asset(
            imgPath,
            width: 24,
            height: 24,
          ),
          Container(
            height: 5,
          ),
          Text(name)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.red,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: expandedHeight,
      titleSpacing: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '歌单',
              style: TextStyle(fontSize: 18),
            ),
            Visibility(
              visible: copywriter != null,
              child: Text(
                copywriter == null ? '' : copywriter,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      flexibleSpace: FlexibleDetailBar(
        content: _buildHeader(music.coverImgUrl, music.playCount),
        background: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: music.coverImgUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: sigma,
                sigmaX: sigma,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
      bottom: CommonPlaylistHeaderBottomView(
        count: music.musicList.length,
        musicModel: music,
        audioPlayer: audioPlayer,
        showBottomView: showBottoView,
        dispatch: dispatch,
      ),
    );
  }
}
