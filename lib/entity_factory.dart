import 'package:music/pages/music/netease_cloud/model/home_banner_entity.dart';
import 'package:music/pages/music/netease_cloud/model/music_url_entity.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'package:music/pages/music/netease_cloud/model/recommend_playlist_entity.dart';
import 'package:music/pages/music/netease_cloud/model/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeBannerEntity") {
      return HomeBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "MusicUrlEntity") {
      return MusicUrlEntity.fromJson(json) as T;
    } else if (T.toString() == "PlayListDetailEntity") {
      return PlayListDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "RecommendPlaylistEntity") {
      return RecommendPlaylistEntity.fromJson(json) as T;
    } else if (T.toString() == "NeteaseCloudUserEntity") {
      return NeteaseCloudUserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}