import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestPageState> buildEffect() {
  return combineEffects(<Object, Effect<TestPageState>>{
    TestPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TestPageState> ctx) {
}
