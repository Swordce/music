import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<QQLoginState> buildEffect() {
  return combineEffects(<Object, Effect<QQLoginState>>{
    QQLoginAction.action: _onAction,
  });
}

void _onAction(Action action, Context<QQLoginState> ctx) {
}
