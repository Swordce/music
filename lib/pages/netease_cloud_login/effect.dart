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
  if(phone.isEmpty || password.isEmpty) {
    Fluttertoast.showToast(msg: "请输入手机号或密码");
    return;
  }
  NeteaseCloudUserEntity user = await NeteaseCloudUserModel.login(ctx.context,phone,password);
  if(user != null && user.code == 200) {
    _onLoginSuccess(user,action,ctx,phone);
  }else {
    _onLoginError(user);
  }

}

void _onLoginSuccess(NeteaseCloudUserEntity user,Action action,Context<NeteaseCloudLoginState> ctx,String userKey) {
  _onSaveUser(user,userKey);
  Fluttertoast.showToast(msg: '欢迎回来，${user.profile.nickname}~',toastLength: Toast.LENGTH_SHORT);
  _jumpToHomePage(action, ctx);
}

void _onLoginError(NeteaseCloudUserEntity user) {
  Fluttertoast.showToast(msg: user != null?'${user.message}':'登录失败',toastLength: Toast.LENGTH_SHORT);
}

void _onSaveUser(NeteaseCloudUserEntity user,String userKey) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString(userKey, json.encode(user));
}

void _jumpToHomePage(Action action,Context<NeteaseCloudLoginState> ctx) {
  Navigator.of(ctx.context).popAndPushNamed('home_page',arguments: null);
}
