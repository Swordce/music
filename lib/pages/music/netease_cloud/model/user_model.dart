import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:music/application.dart';
import 'package:music/utils/net_utils.dart';


import 'home_banner_entity.dart';
import 'recommend_playlist_entity.dart';
import 'user_entity.dart';
import 'play_list_detail_entity.dart';

class NeteaseCloudUserModel {

  //歌单详情
  static Future<PlayListDetailEntity> getPlayListDetail(String id) async {
    var response = await NetUtils.getInstance().get('/playlist/detail',data: {'id':id});
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return PlayListDetailEntity.fromJson(jsonMap);
    }
    return null;
  }

  //推荐歌单
  static Future<RecommendPlaylistEntity> getRecommendPlayList() async {
    var response =
        await NetUtils.getInstance().get('/personalized', data: {'limit': 6});
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return RecommendPlaylistEntity.fromJson(jsonMap);
    }
    return null;
  }

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
