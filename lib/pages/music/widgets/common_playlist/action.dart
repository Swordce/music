import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommonPlaylistAction { action,loadMusicUrl,isInitWidget }

class CommonPlaylistActionCreator {
  static Action onAction() {
    return const Action(CommonPlaylistAction.action);
  }

  static Action onLoadMusicUrl(id) {
    return Action(CommonPlaylistAction.loadMusicUrl,payload: id);
  }


  static Action onIsInitWidget(index) {
    return Action(CommonPlaylistAction.isInitWidget,payload: index);
  }

}
