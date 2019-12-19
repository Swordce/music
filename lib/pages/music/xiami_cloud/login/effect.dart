import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<XiamiLoginState> buildEffect() {
  return combineEffects(<Object, Effect<XiamiLoginState>>{
    XiamiLoginAction.action: _onAction,
  });
}

void _onAction(Action action, Context<XiamiLoginState> ctx) {
}
