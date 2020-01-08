import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommonMusicCoverState> buildEffect() {
  return combineEffects(<Object, Effect<CommonMusicCoverState>>{
    CommonMusicCoverAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommonMusicCoverState> ctx) {
}
