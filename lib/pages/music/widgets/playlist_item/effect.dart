import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/playlist_center_entity.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistCenterItemState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistCenterItemState>>{
    PlaylistCenterItemAction.action: _onAction,
    Lifecycle.initState:_onInit,
  });
}

void _onInit(Action action, Context<PlaylistCenterItemState> ctx) async {
  PlaylistCenterEntity listEntity = await NeteaseCloudNeteaseUtils.getPlaylist(ctx.state.tag);
  if(listEntity != null) {
    ctx.dispatch(PlaylistCenterItemActionCreator.onUpdatePlaylist(listEntity));
    GlobalStore.store.dispatch(GlobalActionCreator.updatePlaylistCenterBgImageUrl(listEntity.playlists[0].coverImgUrl));
  }
}

void _onAction(Action action, Context<PlaylistCenterItemState> ctx) {
}
