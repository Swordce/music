import 'dart:convert';

import 'package:music/application.dart';
import 'package:music/utils/net_utils.dart';

import 'user_entity.dart';

class NeteaseCloudUserModel {
  // GET 请求
  static Future<NeteaseCloudUserEntity> login(String phone, String password) async {
    NeteaseCloudUserEntity user;
    var userInfo = Application.sp.getString('user');
    if (userInfo != null && userInfo.isNotEmpty) {
      user = parseUser(userInfo);
    } else {
      var response = await NetUtils.getInstance().get("/login/cellphone",
          data: {'phone': phone, 'password': password});
      user = parseUser(response.data);
    }
    return user;
  }

  static NeteaseCloudUserEntity parseUser(String user) {
    final jsonMap = json.decode(user);
    return NeteaseCloudUserEntity.fromJson(jsonMap);
  }
}
