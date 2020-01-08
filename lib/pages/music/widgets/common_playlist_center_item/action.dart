import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlaylistCenterItemAction { action,updatePlaylist,refresh,loadMore }

class PlaylistCenterItemActionCreator {
  static Action onAction() {
    return const Action(PlaylistCenterItemAction.action);
  }

  static Action onRefresh() {
    return  Action(PlaylistCenterItemAction.refresh);
  }

  static Action onLoadMore() {
    return  Action(PlaylistCenterItemAction.loadMore);
  }

  static Action onUpdatePlaylist(playlist) {
    return  Action(PlaylistCenterItemAction.updatePlaylist,payload:playlist);
  }
}
