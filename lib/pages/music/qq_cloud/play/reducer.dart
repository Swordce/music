import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<QQMusicState> buildReducer() {
  return asReducer(
    <Object, Reducer<QQMusicState>>{
      QQMusicAction.action: _onAction,
    },
  );
}

QQMusicState _onAction(QQMusicState state, Action action) {
  final QQMusicState newState = state.clone();
  return newState;
}
