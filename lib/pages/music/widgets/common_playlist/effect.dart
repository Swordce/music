import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<CommonPlaylistState> buildEffect() {
  return combineEffects(<Object, Effect<CommonPlaylistState>>{
    CommonPlaylistAction.action: _onAction,
    CommonPlaylistAction.jumpToPlayingMusicPage: _jumpToPlayingMusicPage,
  });
}

void _jumpToPlayingMusicPage(Action action, Context<CommonPlaylistState> ctx) {
  Navigator.of(ctx.context).pushNamed('playing_music_page');
}

void _onAction(Action action, Context<CommonPlaylistState> ctx) {}
