import 'dart:convert';

import 'package:music/application.dart';
import 'package:music/pages/login/model/user_entity.dart';
import 'package:music/utils/net_utils.dart';

class UserModel {
  // GET 请求
  static Future<UserEntity> login(String phone, String password) async {
    UserEntity user;
    var userInfo = Application.sp.getString('user');
    if (userInfo.isNotEmpty) {
      user = parseUser(userInfo);
    } else {
      var response = await NetUtils.getInstance().get("/login/cellphone",
          data: {'phone': phone, 'password': password});
      user = parseUser(response.data);
    }
    return user;
  }

  static UserEntity parseUser(String user) {
    final jsonMap = json.decode(user);
    return UserEntity.fromJson(jsonMap);
  }
}
