import 'dart:convert';

import 'package:music/pages/login/model/user_entity.dart';
import 'package:music/utils/net_utils.dart';

class UserModel {
  // GET 请求
  static Future<UserEntity> login(String phone,String password) async {
    var response = await NetUtils.getInstance().get("/login/cellphone",data: {
      'phone':phone,
      'password':password
    });
    final jsonMap = json.decode(response.data);
    UserEntity user = UserEntity.fromJson(jsonMap);
    return user;
  }


}