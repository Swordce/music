import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<XiamiMusicState> buildEffect() {
  return combineEffects(<Object, Effect<XiamiMusicState>>{
    XiamiMusicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<XiamiMusicState> ctx) {
}
