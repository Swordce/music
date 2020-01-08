import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentRepliedAction { action }

class CommentRepliedActionCreator {
  static Action onAction() {
    return const Action(CommentRepliedAction.action);
  }
}
