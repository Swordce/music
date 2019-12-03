import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.changeTab:_changeTab,
    },
  );
}

HomeState _changeTab(HomeState state,Action action) {
  final HomeState newState = state.clone();
  newState.tabController = action.payload['controller'];
  newState.tabModels = action.payload['tablist'];
  return newState;
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

