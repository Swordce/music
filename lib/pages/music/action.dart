import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicAction { action,initSwiper,initEntrance,initPlaylist }

class MusicActionCreator {
  static Action onAction() {
    return const Action(MusicAction.action);
  }

  static Action onInitSwiper(bannerList) {
    return  Action(MusicAction.initSwiper,payload: bannerList);
  }

  static Action onInitPlaylist(playlist) {
    return  Action(MusicAction.initPlaylist,payload: playlist);
  }

  static Action onInitEntrance() {
    return  Action(MusicAction.initEntrance);
  }
}
