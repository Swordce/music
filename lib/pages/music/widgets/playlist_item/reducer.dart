import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistCenterItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistCenterItemState>>{
      PlaylistCenterItemAction.action: _onAction,
      PlaylistCenterItemAction.updatePlaylist: _onUpdatePlaylist,
    },
  );
}

PlaylistCenterItemState _onUpdatePlaylist(PlaylistCenterItemState state, Action action) {
  final PlaylistCenterItemState newState = state.clone();
  newState.playlist = action.payload;
  return newState;
}

PlaylistCenterItemState _onAction(PlaylistCenterItemState state, Action action) {
  final PlaylistCenterItemState newState = state.clone();
  return newState;
}
