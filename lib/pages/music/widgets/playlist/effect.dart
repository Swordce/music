import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommonPlaylistState> buildEffect() {
  return combineEffects(<Object, Effect<CommonPlaylistState>>{
    CommonPlaylistAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommonPlaylistState> ctx) {
}
