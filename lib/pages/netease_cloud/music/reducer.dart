import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MusicState> buildReducer() {
  return asReducer(
    <Object, Reducer<MusicState>>{
      MusicAction.action: _onAction,
    },
  );
}

MusicState _onAction(MusicState state, Action action) {
  final MusicState newState = state.clone();
  return newState;
}
