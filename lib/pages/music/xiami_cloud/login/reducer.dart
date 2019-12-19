import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<XiamiLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<XiamiLoginState>>{
      XiamiLoginAction.action: _onAction,
    },
  );
}

XiamiLoginState _onAction(XiamiLoginState state, Action action) {
  final XiamiLoginState newState = state.clone();
  return newState;
}
