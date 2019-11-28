import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:music/pages/login/model/user_model.dart';

import 'action.dart';
import 'model/user_entity.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.login: _onLoginAction,
    LoginAction.skipLogin:_onSkipLoginAction,
  });
}

void _onLoginAction(Action action, Context<LoginState> ctx) async {
  UserEntity user = await UserModel.login('17712906965','zwj920814');
  if(user.code == 200) {
    _onLoginSuccess(user,action,ctx);
  }else {
    _onLoginError(user);
  }

}

void _onLoginSuccess(UserEntity user,Action action,Context<LoginState> ctx) {
  print('Success-------------${user.profile.nickname}');
}

void _onLoginError(UserEntity user) {
  print('Error-------------${user.message}');
}

void _onSkipLoginAction(Action action, Context<LoginState> ctx) {
  _jumpToHomePage(action, ctx);
}

void _jumpToHomePage(Action action,Context<LoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
