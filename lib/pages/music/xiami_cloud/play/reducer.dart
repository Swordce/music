import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<XiamiMusicState> buildReducer() {
  return asReducer(
    <Object, Reducer<XiamiMusicState>>{
      XiamiMusicAction.action: _onAction,
    },
  );
}

XiamiMusicState _onAction(XiamiMusicState state, Action action) {
  final XiamiMusicState newState = state.clone();
  return newState;
}
