import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomePageItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomePageItemState>>{
      HomePageItemAction.action: _onAction,
    },
  );
}

HomePageItemState _onAction(HomePageItemState state, Action action) {
  final HomePageItemState newState = state.clone();
  return newState;
}
