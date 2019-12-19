import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum XiamiMusicAction { action }

class XiamiMusicActionCreator {
  static Action onAction() {
    return const Action(XiamiMusicAction.action);
  }
}
