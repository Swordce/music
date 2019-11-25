import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {

  var time = 3;

  @override
  SplashState clone() {
    return SplashState()..time = time;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
