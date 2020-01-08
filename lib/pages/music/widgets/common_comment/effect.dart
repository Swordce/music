import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_comment_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'action.dart';
import 'state.dart';

Effect<CommentState> buildEffect() {
  return combineEffects(<Object, Effect<CommentState>>{
    CommentAction.action: _onAction,
    Lifecycle.initState:_onInit,
    Lifecycle.dispose:_onDispose,
    CommentAction.loadMore:_onLoadMore,
    CommentAction.jumpToReplied:_onJumpToReplied,
  });
}

void _onDispose(Action action, Context<CommentState> ctx) {
  ctx.state.refreshController.dispose();
  ctx.state.textEditingController.dispose();
}

void _onInit(Action action, Context<CommentState> ctx) {
  ctx.state.textEditingController = prefix0.TextEditingController();
  ctx.state.refreshController = RefreshController(initialRefresh: false);
  _loadComment(ctx,ctx.state.currentPage,0);
}

void _onAction(Action action, Context<CommentState> ctx) {
}

void _loadComment(Context<CommentState> ctx,int limit,int before) async {
  PlaylistCommentEntity entity = await NeteaseCloudNetUtils.getPlaylistComment(ctx.state.playlistId,limit);
  if(entity != null) {
    ctx.dispatch(CommentActionCreator.onLoadComments({'entity':entity,'limit':limit}));
    if(entity.more) {
      ctx.state.refreshController.loadComplete();
      return;
    }
    ctx.state.refreshController.loadNoData();
  }else{
    ctx.state.refreshController.loadFailed();
  }
}

void _onLoadMore(Action action, Context<CommentState> ctx) async {
  if(ctx.state.entity.more) {
    _loadComment(ctx,ctx.state.currentPage,0);
  }
}

void _onJumpToReplied(Action action, Context<CommentState> ctx) {
  Navigator.of(ctx.context).pushNamed('common_comment_replied_page',arguments: {'replied':ctx.state.entity.comments[action.payload]});
}
