import 'package:fish_redux/fish_redux.dart';

class HomePageItemState implements Cloneable<HomePageItemState> {

  String title;

  HomePageItemState({this.title});

  @override
  HomePageItemState clone() {
    return HomePageItemState()..title = title;
  }
}

HomePageItemState initState(Map<String, dynamic> args) {
  return HomePageItemState();
}
