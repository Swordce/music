import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RankState> buildReducer() {
  return asReducer(
    <Object, Reducer<RankState>>{
      RankAction.action: _onAction,
      RankAction.loadRanks:_onLoadRanks,
    },
  );
}

RankState _onAction(RankState state, Action action) {
  final RankState newState = state.clone();
  return newState;
}

RankState _onLoadRanks(RankState state, Action action) {
  final RankState newState = state.clone();
  newState.rankModels = action.payload['officalModel'];
  newState.moreRankModels = action.payload['moreModels'];
  return newState;
}
