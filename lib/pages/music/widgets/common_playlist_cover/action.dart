import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommonMusicCoverAction { action }

class CommonMusicCoverActionCreator {
  static Action onAction() {
    return const Action(CommonMusicCoverAction.action);
  }
}
