import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_comment_entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentState>>{
      CommentAction.action: _onAction,
      CommentAction.loadComments:_onLoadComments,
    },
  );
}

CommentState _onLoadComments(CommentState state, Action action) {
  final CommentState newState = state.clone();
  newState.entity = action.payload['entity'];
  newState.currentPage = action.payload['limit']  + 1;
  return newState;
}

CommentState _onAction(CommentState state, Action action) {
  final CommentState newState = state.clone();
  return newState;
}
