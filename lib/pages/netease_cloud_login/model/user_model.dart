import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:music/application.dart';
import 'package:music/utils/net_utils.dart';

import 'user_entity.dart';

class NeteaseCloudUserModel {
  // GET 请求
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
