import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';
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

  Widget _buildHeader(context, String path, int count) {
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
                _buildHeaderItem(context, 'assets/images/icon_comment.png',
                    music.commentCount.toString(), 0),
                _buildHeaderItem(context, 'assets/images/icon_share.png',
                    music.shareCount.toString(), 1),
                _buildHeaderItem(
                    context, 'assets/images/icon_download.png', '下载', 2),
                _buildHeaderItem(
                    context, 'assets/images/icon_multi_select.png', '多选', 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderItem(context, String imgPath, String name, int type) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
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
        onTap: () {
          switch (type) {
            case 0:
              dispatch(PlaylistDetailActionCreator.onJumpToComment());
              break;
            case 1:
              showShareDialog(context);
              break;
            case 2:
              break;
            case 3:
              break;
          }
        },
      ),
    );
  }

  Widget _buildDialogView() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(22),
            child: Text(
              '分享',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 15),
                child: _buildShareItem('assets/images/icon_netease_line.png', '云音乐动态', 5),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: _buildShareItem('assets/images/icon_message.png', '私信', 6),
              ),
              _buildShareItem('assets/images/icon_link.png', '复制链接', 7),
            ],
          ),
          Container(
            height: 1,
            color: Colors.black12,
            margin: EdgeInsets.only(top: 20, bottom: 20),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: GridView.count(
              crossAxisCount: 5,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildShareItem('assets/images/icon_wechat_circle.png', '微信朋友圈', 0),
                _buildShareItem('assets/images/icon_wechat.png', '微信好友', 1),
                _buildShareItem('assets/images/icon_qzone.png', 'QQ空间', 2),
                _buildShareItem('assets/images/icon_qq.png', 'QQ好友', 3),
                _buildShareItem('assets/images/icon_sina.png', '微博', 4),
              ],
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildShareItem(String icon, String title, int index) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.black12, borderRadius: BorderRadius.circular(28)),
            ),
            Image.asset(
              icon,
              width: 25,
              height: 25,
            ),
          ],
        ),
        Container(
          height: 10,
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 11, color: Colors.black),
          ),
        )
      ],
    );
  }

  //分享弹框
  void showShareDialog(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            height: 275,
            child: _buildDialogView(),
          );
        });
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
        content: _buildHeader(context, music.coverImgUrl, music.playCount),
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
