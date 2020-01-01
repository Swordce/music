import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainPageAction { action,tabChanged,jumpToPlayingMusicPage,updateIndex,isInitWidget }

class MainPageActionCreator {
  static Action onAction() {
    return const Action(MainPageAction.action);
  }

  static Action onTabChanged(int index) {
    return Action(MainPageAction.tabChanged,payload: index);
  }

  static Action onJumpToPlayingMusicPage() {
    return Action(MainPageAction.jumpToPlayingMusicPage);
  }

  static Action onUpdateIndex(index) {
    return Action(MainPageAction.updateIndex,payload: index);
  }

  static Action onIsInitWidget(index) {
    return Action(MainPageAction.isInitWidget,payload: index);
  }

}
