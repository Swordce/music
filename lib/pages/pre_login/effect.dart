import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<PreLoginState> buildEffect() {
  return combineEffects(<Object, Effect<PreLoginState>>{
    PreLoginAction.preLogin: _onPreLoginAction,
    PreLoginAction.skipLogin:_onSkipLoginAction,
  });
}

void _onPreLoginAction(Action action, Context<PreLoginState> ctx) {
  Navigator.of(ctx.context).pushNamed('login_page',arguments:null);
}

void _onSkipLoginAction(Action action, Context<PreLoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
