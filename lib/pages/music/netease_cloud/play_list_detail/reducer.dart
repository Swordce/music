import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayListState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayListState>>{
      PlayListAction.action: _onAction,
    },
  );
}

PlayListState _onAction(PlayListState state, Action action) {
  final PlayListState newState = state.clone();
  return newState;
}
