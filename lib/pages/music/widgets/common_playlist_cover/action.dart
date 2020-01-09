import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommonMusicCoverAction { action,saveCover }

class CommonMusicCoverActionCreator {
  static Action onAction() {
    return const Action(CommonMusicCoverAction.action);
  }

  static Action onSaveCover() {
    return Action(CommonMusicCoverAction.saveCover);
  }
}
