import 'package:music/pages/netease_cloud/model/home_banner_entity.dart';
import 'package:music/pages/netease_cloud/model/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeBannerEntity") {
      return HomeBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "NeteaseCloudUserEntity") {
      return NeteaseCloudUserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}