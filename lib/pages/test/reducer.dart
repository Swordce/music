import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestPageState>>{
      TestPageAction.action: _onAction,
    },
  );
}

TestPageState _onAction(TestPageState state, Action action) {
  final TestPageState newState = state.clone();
  return newState;
}
