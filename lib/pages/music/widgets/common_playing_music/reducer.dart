import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayingMusicState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayingMusicState>>{
      PlayingMusicAction.action: _onAction,
    },
  );
}

PlayingMusicState _onAction(PlayingMusicState state, Action action) {
  final PlayingMusicState newState = state.clone();
  return newState;
}
