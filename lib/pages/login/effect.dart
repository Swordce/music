import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.login: _onLoginAction,
    LoginAction.skipLogin:_onSkipLoginAction,
  });
}

void _onLoginAction(Action action, Context<LoginState> ctx) {
}

void _onSkipLoginAction(Action action, Context<LoginState> ctx) {
  _jumpToHomePage(action, ctx);
}

void _jumpToHomePage(Action action,Context<LoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
