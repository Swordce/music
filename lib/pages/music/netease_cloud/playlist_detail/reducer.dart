import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistDetailState>>{
      PlaylistDetailAction.action: _onAction,
      PlaylistDetailAction.loadPlayList:_onLoadPlayList,
    },
  );
}

PlaylistDetailState _onLoadPlayList(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  newState.music = action.payload;
  return newState;
}

PlaylistDetailState _onAction(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  return newState;
}
