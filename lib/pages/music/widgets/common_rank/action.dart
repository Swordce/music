import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RankAction { action,loadRanks }

class RankActionCreator {
  static Action onAction() {
    return const Action(RankAction.action);
  }

  static Action onLoadRanks(rankList) {
    return Action(RankAction.loadRanks,payload: rankList);
  }
}
