import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistDetailState>>{
      PlaylistDetailAction.action: _onAction,
      PlaylistDetailAction.loadPlayList:_onLoadPlayList,
      PlaylistDetailAction.initSwiperIndex: _onInitSwiperIndex,
      PlaylistDetailAction.isInitWidget: _onIsInitWidget,
    },
  );
}

PlaylistDetailState _onIsInitWidget(PlaylistDetailState state, Action action) {
  PlaylistDetailState newState = state.clone();
  newState.isInitWidget = action.payload['isInitWidget'];
  newState.pageIndex = action.payload['pageIndex'];
  println('${newState.pageIndex}------${newState.isInitWidget}');
  return newState;
}

PlaylistDetailState _onInitSwiperIndex(PlaylistDetailState state, Action action) {
  PlaylistDetailState newState = state.clone();
  newState.initMusicIndex = action.payload;
  return newState;
}

PlaylistDetailState _onLoadPlayList(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  newState.music = action.payload;
  return newState;
}

PlaylistDetailState _onAction(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  return newState;
}
