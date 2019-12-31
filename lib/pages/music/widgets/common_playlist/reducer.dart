import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommonPlaylistState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommonPlaylistState>>{
      CommonPlaylistAction.action: _onAction,
//      CommonPlaylistAction.isInitWidget:_onIsInitWidget,
    },
  );
}

CommonPlaylistState _onAction(CommonPlaylistState state, Action action) {
  final CommonPlaylistState newState = state.clone();
  return newState;
}



CommonPlaylistState _onIsInitWidget(CommonPlaylistState state, Action action) {
  CommonPlaylistState newState = state.clone();
  newState.isInitWidget = action.payload['isInitWidget'];
  newState.pageIndex = action.payload['pageIndex'];
  return newState;
}

