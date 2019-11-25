import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.initData:_onInitDataAction,
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _onInitDataAction(HomeState state,Action action) {
  HomeState homeState = state.clone();
  homeState.itemState = action.payload;
  return homeState;
}
