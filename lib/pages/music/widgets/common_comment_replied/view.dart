import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentRepliedState state, Dispatch dispatch, ViewService viewService) {

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
      title: Row(
        children: <Widget>[
          Text(
            '回复',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            '(${state.comments.beReplied.length})',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 20,bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: state.comments.user.avatarUrl,
                  width: 40,
                  height: 40,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      //后期添加点赞功能
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.comments.user.nickname,
                              style: TextStyle(fontSize: 15, color: Colors.black54),
                            ),
                            Container(
                              height: 2,
                            ),
                            Text(
                              TimelineUtil.format(state.comments.time),
                              style: TextStyle(fontSize: 12, color: Colors.black38),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 260,
                      child: Text(
                        state.comments.content,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18, color: Colors.black, wordSpacing: 2),
                      ),
                    ),
                  ],
                ),
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
            '全部回复',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
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
                          imageUrl: state.comments.beReplied[index].user.avatarUrl,
                          width: 40,
                          height: 40,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.comments.beReplied[index].user
                                  .nickname,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                            Container(
                              height: 2,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black38),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 260,
                              child: Text(
                                state.comments.beReplied[index].content,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    wordSpacing: 2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    color: Colors.black12,
                  ),
                ],
              ),
            );
          },
          itemCount: state.comments.beReplied.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        )
      ],
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
                        hintText: "这一次也许就是你上热评了",
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

  return Scaffold(
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
