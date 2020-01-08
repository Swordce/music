import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_comment_entity.dart';

class CommentRepliedState implements Cloneable<CommentRepliedState> {
  Comments comments;
  TextEditingController textEditingController;

  @override
  CommentRepliedState clone() {
    return CommentRepliedState()
    ..textEditingController = TextEditingController()
    ..comments = comments;
  }
}

CommentRepliedState initState(Map<String, dynamic> args) {
  CommentRepliedState newState = CommentRepliedState();
  newState.comments = args['replied'];
  return newState;
}
