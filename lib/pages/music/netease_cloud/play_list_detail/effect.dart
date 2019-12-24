import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayListState> buildEffect() {
  return combineEffects(<Object, Effect<PlayListState>>{
    PlayListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlayListState> ctx) {
}
