import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:music/application.dart';
import 'package:music/pages/music/netease_cloud/model/music_url_entity.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_category_entity.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_entity.dart';
import 'package:music/pages/music/netease_cloud/model/rank_entity.dart';
import 'package:music/utils/net_utils.dart';

import 'home_banner_entity.dart';
import 'play_list_detail_entity.dart';
import 'recommend_playlist_entity.dart';
import 'user_entity.dart';

class NeteaseCloudNetUtils {

  //排行榜
  static Future<RankEntity> getRanklist() async {
    var response  = await NetUtils.getInstance().get('/toplist/detail');
    if(response != null) {
     final jsonMap = json.decode(response.data);
     return RankEntity.fromJson(jsonMap);
    }
    return null;
  }
  
  //获取歌单列表
  static Future<PlaylistCenterEntity> getPlaylist(var tag) async {
    var response = await NetUtils.getInstance().get('/top/playlist/highquality',data: {'cat':tag});
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return PlaylistCenterEntity.fromJson(jsonMap);
    }
    return null;
  }
  
  //热门歌单分类
  static Future<PlaylistCenterCategoryEntity> getHotPlaylist() async {
    var response = await NetUtils.getInstance().get('/playlist/hot');
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return PlaylistCenterCategoryEntity.fromJson(jsonMap);
    }
    return null;
  }

  //歌曲Url
  static Future<MusicUrlEntity> getMusicUrl(String id) async {
    var response = await NetUtils.getInstance().get('/song/url',data: {'id':id});
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return MusicUrlEntity.fromJson(jsonMap);
    }
    return null;
  }

  //歌单详情
  static Future<PlayListDetailEntity> getPlaylistDetail(String id) async {
    var response = await NetUtils.getInstance().get('/playlist/detail',data: {'id':id});
    if(response != null) {
      final jsonMap = json.decode(response.data);
      return PlayListDetailEntity.fromJson(jsonMap);
    }
    return null;
  }

  //推荐歌单
  static Future<RecommendPlaylistEntity> getRecommendPlaylist() async {
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
