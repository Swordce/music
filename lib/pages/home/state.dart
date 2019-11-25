import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/home/adapter/item/state.dart';

class HomeState implements Cloneable<HomeState> {

  List<HomePageItemState> itemState;

  @override
  HomeState clone() {
    return HomeState()..itemState = itemState;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
