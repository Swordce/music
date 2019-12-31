import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommonPlaylistAction { action }

class CommonPlaylistActionCreator {
  static Action onAction() {
    return const Action(CommonPlaylistAction.action);
  }
}
