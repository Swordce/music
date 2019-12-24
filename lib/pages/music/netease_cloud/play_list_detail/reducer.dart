import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayListState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayListState>>{
      PlayListAction.action: _onAction,
      PlayListAction.loadPlayList:_onLoadPlayList,
    },
  );
}

PlayListState _onLoadPlayList(PlayListState state, Action action) {
  final PlayListState newState = state.clone();
  newState.detailPlaylist = action.payload;
  return newState;
}

PlayListState _onAction(PlayListState state, Action action) {
  final PlayListState newState = state.clone();
  return newState;
}
