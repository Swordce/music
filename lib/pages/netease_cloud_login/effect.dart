import 'dart:async';
import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'action.dart';
import 'model/user_entity.dart';
import 'model/user_model.dart';
import 'state.dart';

Effect<NeteaseCloudLoginState> buildEffect() {
  return combineEffects(<Object, Effect<NeteaseCloudLoginState>>{
    NeteaseCloudLoginAction.login: _onLoginAction,
  });
}

void _onLoginAction(Action action, Context<NeteaseCloudLoginState> ctx) async {
  String phone = ctx.state.phoneContronller.text;
  String password = ctx.state.passwordContronller.text;
  NeteaseCloudUserEntity user = await NeteaseCloudUserModel.login(phone,password);
  if(user.code == 200) {
    _onLoginSuccess(user,action,ctx);
  }else {
    _onLoginError(user);
  }

}

void _onLoginSuccess(NeteaseCloudUserEntity user,Action action,Context<NeteaseCloudLoginState> ctx) {
  _onSaveUser(user);
  Fluttertoast.showToast(msg: '欢迎回来，${user.profile.nickname}~',toastLength: Toast.LENGTH_SHORT);
  _jumpToHomePage(action, ctx);
}

void _onLoginError(NeteaseCloudUserEntity user) {
  Fluttertoast.showToast(msg: '${user.message}',toastLength: Toast.LENGTH_SHORT);
}

void _onSaveUser(NeteaseCloudUserEntity user) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString('user', json.encode(user));
}

void _jumpToHomePage(Action action,Context<NeteaseCloudLoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
