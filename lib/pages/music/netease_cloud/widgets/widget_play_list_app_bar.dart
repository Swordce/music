import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/netease_cloud/widgets/flexible_detail_bar.dart';
import 'package:music/pages/music/netease_cloud/widgets/play_list_item.dart';
import 'package:music/pages/music/netease_cloud/widgets/widget_music_list_header.dart';

class PlayListAppBarWidget extends StatelessWidget {
  final double expandedHeight;
  final String backgroundImg;
  final String title;
  final double sigma;
  final int count;
  final String id;

  PlayListAppBarWidget({
    @required this.expandedHeight,
    @required this.title,
    @required this.backgroundImg,
    this.id,
    this.sigma = 5,
    this.count,
  });

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
                path:
                    'https://p1.music.126.net/OcahC3LdNibw0NR-H7dQLg==/109951164541371447.jpg',
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
                      child: Text('失眠夜：就让这些男友音陪你入睡',
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
                          backgroundImage: NetworkImage(
                              "http://p1.music.126.net/wKC3ilv-31BXw2SENCENGA==/109951163390157568.jpg"),
                          radius: 12,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 120),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text('YouTube视频精选推荐',
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
                              child: Text('表白的歌词\n性感的嗓音\n睡前耳朵的福利\n安静夜晚伴你入睡',
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
            margin: EdgeInsets.only(top: 30,bottom: 10),
            child: Row(
              children: <Widget>[
                _buildHeaderItem('assets/images/icon_comment.png',471.toString()),
                _buildHeaderItem('assets/images/icon_share.png',151.toString()),
                _buildHeaderItem('assets/images/icon_download.png','下载'),
                _buildHeaderItem('assets/images/icon_multi_select.png','多选'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String imgPath,String name) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Image.asset(imgPath,width: 24,height: 24,),
          Container(height: 5,),
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
        content: _buildHeader(backgroundImg, count),
        background: Stack(
          children: <Widget>[
            backgroundImg.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: backgroundImg,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    backgroundImg,
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
        count: count,
      ),
    );
  }
}
