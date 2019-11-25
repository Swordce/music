import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.action: _onAction,
      SplashAction.countDownTime:_onCountDownTime,
    },
  );
}

SplashState _onAction(SplashState state, Action action) {
  final SplashState newState = state.clone();
  return newState;
}

SplashState _onCountDownTime(SplashState state,Action action) {
  final SplashState countDownTimeState = state.clone();
  countDownTimeState.time = state.clone().time - 1;
  return countDownTimeState;
}