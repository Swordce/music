import 'package:fish_redux/fish_redux.dart';

class WelfareState implements Cloneable<WelfareState> {

  @override
  WelfareState clone() {
    return WelfareState();
  }
}

WelfareState initState(Map<String, dynamic> args) {
  return WelfareState();
}
