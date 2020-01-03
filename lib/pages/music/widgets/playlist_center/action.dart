import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlaylistCenterAction { action,initController,updateBgImageUrl,updateCategory,updatePlaylist,initSwiperIndex,isInitWidget }

class PlaylistCenterActionCreator {
  static Action onAction() {
    return const Action(PlaylistCenterAction.action);
  }

  static Action onUpdatePlaylist(playlist) {
    return Action(PlaylistCenterAction.updatePlaylist,payload: playlist);
  }

  static Action onUpdateCategory(tags) {
    return Action(PlaylistCenterAction.updateCategory,payload: tags);
  }


  static Action onInitController(tags) {
    return Action(PlaylistCenterAction.initController,payload: tags);
  }

  static Action onUpdateBgImageUrl(url) {
    return Action(PlaylistCenterAction.updateBgImageUrl,payload: url);
  }

  static Action onInitSwiperIndex(index) {
    return Action(PlaylistCenterAction.initSwiperIndex,payload: index);
  }

  static Action onIsInitWidget(index) {
    return Action(PlaylistCenterAction.isInitWidget,payload: index);
  }
}
