import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistCenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistCenterState>>{
      PlaylistCenterAction.action: _onAction,
      PlaylistCenterAction.updateCategory: _onUpdateCategory,
      PlaylistCenterAction.updatePlaylist: _onUpdatePlaylist,
      PlaylistCenterAction.updateBgImageUrl: _onUpdateBgImageUrl,
    },
  );
}

PlaylistCenterState _onUpdateCategory(PlaylistCenterState state, Action action) {
  final PlaylistCenterState newState = state.clone();
  newState.playlistCenterTags = action.payload;
  return newState;
}

PlaylistCenterState _onUpdatePlaylist(PlaylistCenterState state, Action action) {
  final PlaylistCenterState newState = state.clone();
  newState.playlist = action.payload;
  return newState;
}


PlaylistCenterState _onUpdateBgImageUrl(PlaylistCenterState state, Action action) {
  final PlaylistCenterState newState = state.clone();
  newState.bgUrl = action.payload;
  return newState;
}


PlaylistCenterState _onAction(PlaylistCenterState state, Action action) {
  final PlaylistCenterState newState = state.clone();
  return newState;
}