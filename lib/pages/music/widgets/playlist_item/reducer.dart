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
  bool isload = action.payload['isLoad'];
  if(isload) {
    newState.playlist = action.payload['playlist'];
  }else{
    newState.playlist.addAll(action.payload['playlist']);
  }
  newState.updateTime = action.payload['time'];
  return newState;
}

PlaylistCenterItemState _onAction(PlaylistCenterItemState state, Action action) {
  final PlaylistCenterItemState newState = state.clone();
  return newState;
}
