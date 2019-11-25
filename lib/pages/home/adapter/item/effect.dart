import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomePageItemState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageItemState>>{
    HomePageItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomePageItemState> ctx) {
}
