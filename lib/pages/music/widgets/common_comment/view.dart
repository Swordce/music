import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.of(viewService.context).pop();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.black,
          onPressed: () {
            Fluttertoast.showToast(msg: '分享评论');
          },
        ),
      ],
      title: Row(
        children: <Widget>[
          Text(
            '评论',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            '(${state.commentCount})',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(index) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: state.entity.comments[index].user.avatarUrl,
                  width: 40,
                  height: 40,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                state.entity.comments[index].user.nickname,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 2, top: 3),
                                  child: Text(
                                    state.entity.comments[index].likedCount == 0
                                        ? '  '
                                        : '${state.entity.comments[index].likedCount}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/images/icon_parise.png',
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                      ),
                      Text(
                        TimelineUtil.format(state.entity.comments[index].time),
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 260,
                        child: Text(
                          state.entity.comments[index].content,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              wordSpacing: 2),
                        ),
                      ),
                      state.entity.comments[index].beReplied == null ||
                              state.entity.comments[index].beReplied.length == 0
                          ? Container()
                          : Container(
                              child: GestureDetector(
                                onTap: () {
                                  dispatch(CommentActionCreator.onJumpToReplied(
                                      index));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '${state.entity.comments[index].beReplied.length}条回复',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          index == (state.entity.comments.length - 1)
              ? Container(
                  height: 10,
                )
              : Container(
                  height: 1,
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  color: Colors.black12,
                ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SmartRefresher(
      controller: state.refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () {
        dispatch(CommentActionCreator.onLoadMore());
      },
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: state.coverImgUrl,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(viewService.context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            state.title,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Container(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'by ',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              Text(
                                '${state.nickname}',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.black38,
                  size: 30,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              '精彩评论',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return _buildItem(index);
            },
            itemCount: state.entity.comments.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 1,
            color: Colors.black12,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: state.textEditingController,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "随乐而起，有感而发",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: '需要登录~');
                    },
                    child: Text(
                      '发送',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  return state.entity == null
      ? Container(
          color: Colors.white,
        )
      : Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppbar(),
          body: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: _buildBody(),
              ),
              _buildBottom(),
            ],
          ),
        );
}
