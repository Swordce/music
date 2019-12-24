import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NeteaseState> buildReducer() {
  return asReducer(
    <Object, Reducer<NeteaseState>>{
      NeteaseAction.action: _onAction,
    },
  );
}

NeteaseState _onAction(NeteaseState state, Action action) {
  final NeteaseState newState = state.clone();
  return newState;
}


