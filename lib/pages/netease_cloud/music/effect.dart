import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MusicState> buildEffect() {
  return combineEffects(<Object, Effect<MusicState>>{
    MusicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MusicState> ctx) {
}
