import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<CommentRepliedState> buildEffect() {
  return combineEffects(<Object, Effect<CommentRepliedState>>{
    CommentRepliedAction.action: _onAction,
    Lifecycle.initState:_onInit,
    Lifecycle.dispose:_onDispose,
  });
}

void _onInit(Action action, Context<CommentRepliedState> ctx) {
  ctx.state.textEditingController = TextEditingController();
}


void _onDispose(Action action, Context<CommentRepliedState> ctx) {
  ctx.state.textEditingController.dispose();
}


void _onAction(Action action, Context<CommentRepliedState> ctx) {
}
