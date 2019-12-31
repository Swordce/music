import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_playlist_model.dart';
import 'package:music/pages/music/netease_cloud/model/home_banner_entity.dart';
import 'package:music/pages/music/state.dart';

class NeteaseState implements Cloneable<NeteaseState> {
//快捷入口
  Map<String, String> map;
  var keys;

  //banner
  List<HomeBannerBanner> bannerList;

  //推荐歌单
  List<CommonPlaylistModel> recommendList;

  @override
  NeteaseState clone() {
    return NeteaseState()
      ..map = map
      ..bannerList = bannerList
      ..recommendList = recommendList;
  }
}

class NeteaseConnector extends ConnOp<MusicState, NeteaseState> {
  @override
  NeteaseState get(MusicState state) {
    NeteaseState newState = new NeteaseState();
    newState.map = state.map;
    newState.keys = state.keys;
    newState.recommendList = state.recommendList;
    newState.bannerList = state.bannerList;

    return newState;
  }
}
