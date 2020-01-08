import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommonMusicCoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommonMusicCoverState>>{
      CommonMusicCoverAction.action: _onAction,
    },
  );
}

CommonMusicCoverState _onAction(CommonMusicCoverState state, Action action) {
  final CommonMusicCoverState newState = state.clone();
  return newState;
}
