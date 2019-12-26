import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeSwiperState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeSwiperState>>{
      HomeSwiperAction.updateBanner:_updateBanner,
    },
  );
}

HomeSwiperState _updateBanner(HomeSwiperState state, Action action) {
  final HomeSwiperState newState = state.clone();
  newState.bannerList = action.payload;
  return newState;
}
