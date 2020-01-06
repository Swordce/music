import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_category_entity.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';

import 'action.dart';
import 'state.dart';

Effect<PlaylistCenterState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistCenterState>>{
    Lifecycle.initState: _onInit,
    Lifecycle.dispose:_onDispose,
    PlaylistCenterAction.initController:_onInitController,
  });
}

void _onDispose(Action action,Context<PlaylistCenterState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(true));
  ctx.state.scrollController.dispose();
  ctx.state.tabController.dispose();
}

void _onInit(Action action, Context<PlaylistCenterState> ctx) {
  initSwiperIndex(action, ctx);
  _onInitController(action, ctx);
  _requestPlaylistCategory(ctx);
}

///初始化swiperIndex
void initSwiperIndex(Action action, Context<PlaylistCenterState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(false));
  GlobalStore.store.dispatch(GlobalActionCreator.onInitSwiperIndex(ctx.state.currentIndex));
}

void _onInitController(Action action, Context<PlaylistCenterState> ctx) {
  final Object ticker = ctx.stfState;
  List<PlaylistCenterTags> tags = action.payload;
  ctx.state.tabController =
  TabController(vsync: ticker, initialIndex: 0,length: tags == null ? 0 : tags.length)
    ..addListener(() {
      if (!ctx.state.tabController.indexIsChanging) {
        if(ctx.state.tabController.index <= ctx.state.playlistCenterBgImageUrl.length) {
          String url = ctx.state.playlistCenterBgImageUrl[ctx.state.tabController.index];
          ctx.dispatch(PlaylistCenterActionCreator.onUpdateBgImageUrl(url));
        }
      }
    });
  ctx.state.scrollController = ScrollController();
}

void _requestPlaylistCategory(Context<PlaylistCenterState> ctx) async {
  PlaylistCenterCategoryEntity entity = await NeteaseCloudNetUtils.getHotPlaylist();
  if(entity != null) {
    ctx.dispatch(PlaylistCenterActionCreator.onInitController(entity.tags));
    ctx.dispatch(PlaylistCenterActionCreator.onUpdateCategory(entity.tags));
  }
}

void _onAction(Action action, Context<PlaylistCenterState> ctx) {}
