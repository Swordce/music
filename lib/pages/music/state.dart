import 'package:fish_redux/fish_redux.dart';

import 'netease_cloud/model/home_banner_entity.dart';
import 'netease_cloud/model/recommend_playlist_entity.dart';

class MusicState implements Cloneable<MusicState> {
  //快捷入口
  Map<String, String> map;
  var keys;

  //banner
  List<HomeBannerBanner> bannerList;

  //推荐歌单
  List<RecommandPlaylistResult> recommendList;

  @override
  MusicState clone() {
    return MusicState()
      ..map = map
      ..keys = keys
      ..bannerList = bannerList
      ..recommendList = recommendList;
  }
}

MusicState initState(Map<String, dynamic> args) {
  MusicState musicState = new MusicState();
  musicState.map = Map();
  musicState.keys = musicState.map.keys.toList();
  musicState.bannerList = List();
  musicState.recommendList = List();
  return MusicState();
}
