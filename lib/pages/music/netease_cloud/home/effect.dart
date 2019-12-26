import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<NeteaseState> buildEffect() {
  return combineEffects(<Object, Effect<NeteaseState>>{
    NeteaseAction.action: _onAction,
    NeteaseAction.jumpToPlayList: _onJumpToPlayList,
  });
}

void _onJumpToPlayList(Action action, Context<NeteaseState> ctx) {
  Navigator.of(ctx.context).pushNamed('playlist_detail_page',arguments: action.payload);
}

void _onAction(Action action, Context<NeteaseState> ctx) {
}