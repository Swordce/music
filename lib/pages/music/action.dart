import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MusicAction { action,initSwiper,initEntrance,initPlayList }

class MusicActionCreator {
  static Action onAction() {
    return const Action(MusicAction.action);
  }

  static Action onInitSwiper(bannerList) {
    return  Action(MusicAction.initSwiper,payload: bannerList);
  }

  static Action onInitPlayList(playList) {
    return  Action(MusicAction.initPlayList,payload: playList);
  }

  static Action onInitEntrance() {
    return  Action(MusicAction.initEntrance);
  }
}
