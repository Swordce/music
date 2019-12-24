import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'package:music/pages/music/netease_cloud/widgets/flexible_detail_bar.dart';
import 'package:music/pages/music/netease_cloud/widgets/play_list_item.dart';
import 'package:music/pages/music/netease_cloud/widgets/widget_music_list_header.dart';

class PlayListAppBarWidget extends StatelessWidget {
  final double expandedHeight;
  final double sigma;
  final String backgroundImg;
  final int playCount;
  final String title;
  final String avatar;
  final String nickName;
  final String description;
  final int commentCount;
  final int shareCount;
  final int musicCount;

  PlayListAppBarWidget(
      {Key key,
      this.expandedHeight,
      this.sigma,
      this.backgroundImg,
      this.playCount,
      this.title,
      this.avatar,
      this.nickName,
      this.description,
      this.commentCount,
      this.shareCount,
      this.musicCount})
      : super(key: key);

  Widget _buildHeader(String path, int count) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 80),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              PlayListItem(
                width: 120,
                height: 120,
                path: backgroundImg,
                count: count,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: 180,
                      child: Text(title,
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
                          backgroundImage:
                              NetworkImage(avatar),
                          radius: 12,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 120),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(nickName,
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
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(maxWidth: 120),
                              margin: EdgeInsets.only(right: 20),
                              child: Text(description,
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
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              children: <Widget>[
                _buildHeaderItem('assets/images/icon_comment.png',
                    commentCount.toString()),
                _buildHeaderItem('assets/images/icon_share.png',
                    shareCount.toString()),
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
      leading: Icon(Icons.arrow_back),
      expandedHeight: expandedHeight,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      flexibleSpace: FlexibleDetailBar(
        content:
            _buildHeader(backgroundImg, playCount),
        background: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: backgroundImg,
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
      bottom: MusicListHeader(
        count: musicCount,
      ),
    );
  }
}
