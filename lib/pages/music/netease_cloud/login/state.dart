import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class NeteaseCloudLoginState implements Cloneable<NeteaseCloudLoginState> {
  TextEditingController phoneContronller;
  TextEditingController passwordContronller;
  bool phone= false;
  bool password=false;

  @override
  NeteaseCloudLoginState clone() {
    return NeteaseCloudLoginState()
    ..phoneContronller = phoneContronller
    ..passwordContronller = passwordContronller
    ..phone=phone
    ..password=password;
  }
}

NeteaseCloudLoginState initState(Map<String, dynamic> args) {
  final NeteaseCloudLoginState state = new NeteaseCloudLoginState();
  state.phoneContronller = new TextEditingController();
  state.passwordContronller = new TextEditingController();
  state.phoneContronller.text = '17712906965';
  state.passwordContronller.text = 'zwj920814';
  return state;
}
