import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/home/adapter/item/state.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _initData,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _initData(Action action, Context<HomeState> ctx) {
  List<HomePageItemState> mockData = [
    HomePageItemState(title: "标题a"),
    HomePageItemState(title: "标题b"),
    HomePageItemState(title: "标题c"),
    HomePageItemState(title: "标题d"),
    HomePageItemState(title: "标题e"),
    HomePageItemState(title: "标题f"),
    HomePageItemState(title: "标题g"),
    HomePageItemState(title: "标题h"),
    HomePageItemState(title: "标题i"),
    HomePageItemState(title: "标题j"),
    HomePageItemState(title: "标题k"),
    HomePageItemState(title: "标题l"),
  ];
  ctx.dispatch(HomeActionCreator.onInitAction(mockData));
}
