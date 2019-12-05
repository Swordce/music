import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:music/application.dart';
import 'package:music/utils/net_utils.dart';

import 'home_banner_entity.dart';
import 'user_entity.dart';

class NeteaseCloudUserModel {
  //Banner
  static Future<HomeBannerEntity> getBanner() async {
    var response =
        await NetUtils.getInstance().get('/banner', data: {'type': 2});
    if (response != null) {
      final jsonMap = json.decode(response.data);
      return HomeBannerEntity.fromJson(jsonMap);
    }
    return null;
  }

  //登录
  static Future<NeteaseCloudUserEntity> login(
      BuildContext context, String phone, String password) async {
    NeteaseCloudUserEntity user;
    var userInfo = Application.sp.getString(phone);
    if (userInfo != null && userInfo.isNotEmpty) {
      user = parseUser(userInfo);
    } else {
      var response = await NetUtils.getInstance().get("/login/cellphone",
          data: {'phone': phone, 'password': password});
      if (response != null) {
        user = parseUser(response.data);
      } else {
        return null;
      }
    }
    return user;
  }

  static NeteaseCloudUserEntity parseUser(String user) {
    final jsonMap = json.decode(user);
    return NeteaseCloudUserEntity.fromJson(jsonMap);
  }
}
