import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WelfareState> buildEffect() {
  return combineEffects(<Object, Effect<WelfareState>>{
    WelfareAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WelfareState> ctx) {
}
