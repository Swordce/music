import 'dart:async';
import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  _onSaveUser(user);
  Fluttertoast.showToast(msg: '欢迎回来，${user.profile.nickname}~',toastLength: Toast.LENGTH_SHORT);
  _jumpToHomePage(action, ctx);
}

void _onLoginError(UserEntity user) {
  Fluttertoast.showToast(msg: '${user.message}',toastLength: Toast.LENGTH_SHORT);
}

void _onSaveUser(UserEntity user) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString('user', json.encode(user));
}

void _onSkipLoginAction(Action action, Context<LoginState> ctx) {
  _jumpToHomePage(action, ctx);
}

void _jumpToHomePage(Action action,Context<LoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
