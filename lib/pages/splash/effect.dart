import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:music/application.dart';
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    SplashAction.jumpToLogin:_onLogin,
    Lifecycle.initState:_initCountDownTimerState,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}

void _onLogin(Action action,Context<SplashState> ctx) async {
  await Application.initSp();
  Navigator.of(ctx.context).popAndPushNamed("login_page",arguments: null);
}

void _initCountDownTimerState(Action action,Context<SplashState> ctx) {
  Timer.periodic(Duration(seconds: 1), (timer){
    if(ctx.state.time > 0) {
      ctx.dispatch(SplashActionCreator.onCountDownTime());
    }else{
      timer.cancel();
      _onLogin(action, ctx);
    }
  });
}