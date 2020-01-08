import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_entity.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistCenterItemState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistCenterItemState>>{
    PlaylistCenterItemAction.action: _onAction,
    PlaylistCenterItemAction.refresh: _onRefresh,
    PlaylistCenterItemAction.loadMore: _onLoadMore,
    Lifecycle.initState:_onInit,
    Lifecycle.dispose:_onDispose,
  });
}

void _onDispose(Action action, Context<PlaylistCenterItemState> ctx) {
  ctx.state.refreshController.dispose();
}

void _onInit(Action action, Context<PlaylistCenterItemState> ctx) {
  ctx.state.refreshController = RefreshController(initialRefresh: false);
  _loadData(ctx,'');
}

void _onAction(Action action, Context<PlaylistCenterItemState> ctx) {
}

void _loadData(Context<PlaylistCenterItemState> ctx,String updateTime) async {
  PlaylistCenterEntity listEntity = await NeteaseCloudNetUtils.getPlaylist(ctx.state.tag,updateTime);
  if(listEntity != null) {
    if(listEntity != null && listEntity.playlists.length > 0) {
      ctx.dispatch(PlaylistCenterItemActionCreator.onUpdatePlaylist({'playlist':listEntity.playlists,'time':listEntity.lasttime,'isLoad':updateTime.isEmpty?true:false}));
      GlobalStore.store.dispatch(GlobalActionCreator.updatePlaylistCenterBgImageUrl(listEntity.playlists[0].coverImgUrl));
    }
    if(listEntity.more) {
      ctx.state.refreshController.loadComplete();
    }else{
      ctx.state.refreshController.loadNoData();
    }
  }else{
    ctx.state.refreshController.loadFailed();
  }
}

void _onRefresh(Action action,Context<PlaylistCenterItemState> ctx) async {
  ctx.state.refreshController.refreshCompleted();
}

void _onLoadMore(Action action,Context<PlaylistCenterItemState> ctx) async {
  _loadData(ctx, ctx.state.updateTime.toString());
}
