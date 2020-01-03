import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommonPlaylistState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommonPlaylistState>>{
      CommonPlaylistAction.action: _onAction,
    },
  );
}

CommonPlaylistState _onAction(CommonPlaylistState state, Action action) {
  final CommonPlaylistState newState = state.clone();
  return newState;
}


