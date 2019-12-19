import 'package:fish_redux/fish_redux.dart';

class XiamiLoginState implements Cloneable<XiamiLoginState> {

  @override
  XiamiLoginState clone() {
    return XiamiLoginState();
  }
}

XiamiLoginState initState(Map<String, dynamic> args) {
  return XiamiLoginState();
}
