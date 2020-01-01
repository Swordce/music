import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayingMusicAction { action,previousMusic,nextMusic,playingState,playingOrder }

class PlayingMusicActionCreator {
  static Action onAction() {
    return const Action(PlayingMusicAction.action);
  }

  static Action onPreviousMusic() {
    return const Action(PlayingMusicAction.previousMusic);
  }

  static Action onNextMusic() {
    return const Action(PlayingMusicAction.nextMusic);
  }

  static Action onPlayingState() {
    return const Action(PlayingMusicAction.playingState);
  }

  static Action onPlayingOrder() {
    return const Action(PlayingMusicAction.playingOrder);
  }

}
