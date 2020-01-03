import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlaylistCenterItemAction { action,updatePlaylist }

class PlaylistCenterItemActionCreator {
  static Action onAction() {
    return const Action(PlaylistCenterItemAction.action);
  }

  static Action onUpdatePlaylist(playlist) {
    return  Action(PlaylistCenterItemAction.updatePlaylist,payload:playlist);
  }
}
