import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_playlist_model.dart';
import 'action.dart';
import 'netease_cloud/model/home_banner_entity.dart';
import 'netease_cloud/model/recommend_playlist_entity.dart';
import 'netease_cloud/model/netease_network_utils.dart';
import 'state.dart';

Effect<MusicState> buildEffect() {
  return combineEffects(<Object, Effect<MusicState>>{
    MusicAction.action: _onAction,
    Lifecycle.initState: _initData,
  });
}

void _onAction(Action action, Context<MusicState> ctx) {}

void _initData(Action action, Context<MusicState> ctx) async {
  ctx.dispatch(MusicActionCreator.onInitEntrance());
  HomeBannerEntity banners = await _onGetSwiperListAction(action, ctx);
  if (banners != null) {
    ctx.dispatch(MusicActionCreator.onInitSwiper(banners.banners));
  }
  List<CommonPlaylistModel> playlist =
      await _onGetRecommendPlaylistAction(action, ctx);
  if (playlist != null) {
    ctx.dispatch(MusicActionCreator.onInitPlaylist(playlist));
  }
}

Future<HomeBannerEntity> _onGetSwiperListAction(
    Action action, Context<MusicState> ctx) async {
  HomeBannerEntity banners = await NeteaseCloudNeteaseUtils.getBanner();
  if (banners != null && banners.code == 200) {
    return banners;
  }
  return null;
}

Future<List<CommonPlaylistModel>> _onGetRecommendPlaylistAction(
    Action action, Context<MusicState> ctx) async {
  RecommendPlaylistEntity entity =
      await NeteaseCloudNeteaseUtils.getRecommendPlaylist();
  if (entity != null && entity.code == 200) {
    List<CommonPlaylistModel> models = [];
    List<RecommandPlaylistResult> result = entity.result;
    for (int i = 0; i < result.length; i++) {
      CommonPlaylistModel model = CommonPlaylistModel();
      model.id = result[i].id.toString();
      model.picUrl = result[i].picUrl;
      model.copywriter = result[i].copywriter;
      model.playCount = result[i].playCount;
      model.playlistName = result[i].name;
      models.add(model);
    }
    return models;
  }
  return null;
}
