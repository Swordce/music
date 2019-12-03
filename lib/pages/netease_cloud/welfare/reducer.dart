import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WelfareState> buildReducer() {
  return asReducer(
    <Object, Reducer<WelfareState>>{
      WelfareAction.action: _onAction,
    },
  );
}

WelfareState _onAction(WelfareState state, Action action) {
  final WelfareState newState = state.clone();
  return newState;
}
