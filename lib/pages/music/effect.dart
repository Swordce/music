import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'netease_cloud/model/home_banner_entity.dart';
import 'netease_cloud/model/recommend_playlist_entity.dart';
import 'netease_cloud/model/user_model.dart';
import 'state.dart';

Effect<MusicState> buildEffect() {
  return combineEffects(<Object, Effect<MusicState>>{
    MusicAction.action: _onAction,
    Lifecycle.initState:_initData,
  });
}

void _onAction(Action action, Context<MusicState> ctx) {
}


void _initData(Action action, Context<MusicState> ctx) async {
  ctx.dispatch(MusicActionCreator.onInitEntrance());
  HomeBannerEntity banners = await _onGetSwiperListAction(action,ctx);
  if(banners != null) {
    ctx.dispatch(MusicActionCreator.onInitSwiper(banners.banners));
  }
  RecommendPlaylistEntity playlistEntity = await _onGetRecommendPlayListAction(action, ctx);
  if(playlistEntity != null) {
    ctx.dispatch(MusicActionCreator.onInitPlayList(playlistEntity.result));
  }
}

Future<HomeBannerEntity> _onGetSwiperListAction(Action action,Context<MusicState> ctx) async {
  HomeBannerEntity banners = await NeteaseCloudUserModel.getBanner();
  if(banners != null && banners.code == 200) {
    return banners;
  }
  return null;
}

Future<RecommendPlaylistEntity> _onGetRecommendPlayListAction(Action action, Context<MusicState> ctx) async {
  RecommendPlaylistEntity playlist = await NeteaseCloudUserModel.getRecommendPlayList();
  if(playlist != null && playlist.code == 200) {
    return playlist;
  }
  return null;
}

