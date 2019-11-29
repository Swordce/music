import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PreLoginAction { preLogin,skipLogin}

class PreLoginActionCreator {
  static Action onPreLogin() {
    return const Action(PreLoginAction.preLogin);
  }

  static Action onSkipLogin() {
    return const Action(PreLoginAction.skipLogin);
  }
}
