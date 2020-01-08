import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommentRepliedState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommentRepliedState>>{
      CommentRepliedAction.action: _onAction,
    },
  );
}

CommentRepliedState _onAction(CommentRepliedState state, Action action) {
  final CommentRepliedState newState = state.clone();
  return newState;
}
