import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<QQLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<QQLoginState>>{
      QQLoginAction.action: _onAction,
    },
  );
}

QQLoginState _onAction(QQLoginState state, Action action) {
  final QQLoginState newState = state.clone();
  return newState;
}
