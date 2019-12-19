import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NeteaseCloudLoginAction { setPhone,setPassword,clearPhoneField,clearPasswordField,login}

class NeteaseCloudLoginActionCreator {

  static Action onSetPhone(String text) {
    return Action(NeteaseCloudLoginAction.setPhone,payload: text);
  }

  static Action onSetPassword(String text) {
    return Action(NeteaseCloudLoginAction.setPassword,payload: text);
  }

  static Action onLogin() {
    return const Action(NeteaseCloudLoginAction.login);
  }

  static Action onClearPhoneTextField() {
    return Action(NeteaseCloudLoginAction.clearPhoneField);
  }

  static Action onClearPasswordTextField() {
    return Action(NeteaseCloudLoginAction.clearPasswordField);
  }

}
