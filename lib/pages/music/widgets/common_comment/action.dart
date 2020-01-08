import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CommentAction { action,loadComments,loadMore,jumpToReplied }

class CommentActionCreator {
  static Action onAction() {
    return const Action(CommentAction.action);
  }

  static Action onLoadComments(comments) {
    return  Action(CommentAction.loadComments,payload: comments);
  }

  static Action onLoadMore() {
    return  Action(CommentAction.loadMore);
  }

  static Action onJumpToReplied(int index) {
    return  Action(CommentAction.jumpToReplied,payload: index);
  }
}
