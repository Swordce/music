import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_comment_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentState implements Cloneable<CommentState> {
  String playlistId;
  String coverImgUrl;
  String title;
  String nickname;
  int commentCount;
  PlaylistCommentEntity entity;
  int currentPage;
  RefreshController refreshController;
  TextEditingController textEditingController;


  @override
  CommentState clone() {
    return CommentState()
    ..textEditingController = textEditingController
    ..refreshController = refreshController
      ..currentPage = currentPage
      ..entity = entity
      ..playlistId = playlistId
      ..coverImgUrl = coverImgUrl
      ..title = title
      ..nickname = nickname
      ..commentCount = commentCount;
  }
}

CommentState initState(Map<String, dynamic> args) {
  CommentState newState = CommentState();
  newState.playlistId = args['playlistId'];
  newState.coverImgUrl = args['coverImageUrl'];
  newState.title = args['title'];
  newState.nickname = args['nickName'];
  newState.commentCount = args['commentCount'];
  newState.currentPage = 1;
  return newState;
}
