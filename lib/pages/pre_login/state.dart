import 'package:fish_redux/fish_redux.dart';

class PreLoginState implements Cloneable<PreLoginState> {



  @override
  PreLoginState clone() {
    return PreLoginState();
  }
}

PreLoginState initState(Map<String, dynamic> args) {
  return PreLoginState();
}
