import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SplashAction { action,jumpToLogin,countDownTime }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.jumpToLogin);
  }

  static Action onJumpToLogin() {
    return const Action(SplashAction.jumpToLogin);
  }

  static Action onCountDownTime() {
    return const Action(SplashAction.countDownTime);
  }
}
