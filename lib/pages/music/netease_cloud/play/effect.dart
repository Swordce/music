import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/home_banner_entity.dart';
import 'package:music/pages/music/netease_cloud/model/recommend_playlist_entity.dart';
import 'package:music/pages/music/netease_cloud/model/user_model.dart';
import 'action.dart';
import 'state.dart';

Effect<NeteaseState> buildEffect() {
  return combineEffects(<Object, Effect<NeteaseState>>{
    NeteaseAction.action: _onAction,
  });
}

void _initData(Action action, Context<NeteaseState> ctx) async {
  Map<String,Object> entranceMap = _onInitEntrance(action, ctx);
  HomeBannerEntity banners = await _onGetSwiperListAction(action,ctx);
  RecommendPlaylistEntity playlistEntity = await _onGetRecommendPlayListAction(action, ctx);
  Map<String,Object> map = {
    'banner':banners.banners,
    'playlist':playlistEntity.result,
    'entrance':entranceMap
  };
  println('banner size=${banners.banners.length})');
  ctx.dispatch(NeteaseActionCreator.onInitEntrance(map));
}

Map<String,dynamic> _onInitEntrance(Action action,Context<NeteaseState> ctx) {
  Map<String,dynamic> map = {
    '每日推荐': 'images/icon_daily.png',
    '歌单': 'images/icon_playlist.png',
    '排行榜': 'images/icon_rank.png',
    '电台': 'images/icon_radio.png',
  };
  return map;
}

Future<HomeBannerEntity> _onGetSwiperListAction(Action action,Context<NeteaseState> ctx) async {
  HomeBannerEntity banners = await NeteaseCloudUserModel.getBanner();
  if(banners != null && banners.code == 200) {
    return banners;
  }
  return null;
}

Future<RecommendPlaylistEntity> _onGetRecommendPlayListAction(Action action, Context<NeteaseState> ctx) async {
  RecommendPlaylistEntity playlist = await NeteaseCloudUserModel.getRecommendPlayList();
  if(playlist != null && playlist.code == 200) {
    return playlist;
  }
  return null;
}

void _onAction(Action action, Context<NeteaseState> ctx) {
}
