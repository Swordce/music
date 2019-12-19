import 'package:fish_redux/fish_redux.dart';

class QQLoginState implements Cloneable<QQLoginState> {

  @override
  QQLoginState clone() {
    return QQLoginState();
  }
}

QQLoginState initState(Map<String, dynamic> args) {
  return QQLoginState();
}
