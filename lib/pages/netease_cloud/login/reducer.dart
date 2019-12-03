import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<NeteaseCloudLoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<NeteaseCloudLoginState>>{
      NeteaseCloudLoginAction.login: _onAction,
      NeteaseCloudLoginAction.clearPhoneField: _clearPhoneTextField,
      NeteaseCloudLoginAction.clearPasswordField: _clearPasswordTextField,
      NeteaseCloudLoginAction.setPhone: _setPhone,
      NeteaseCloudLoginAction.setPassword: _setPassword,
    },
  );
}

NeteaseCloudLoginState _setPassword(
    NeteaseCloudLoginState state, Action action) {
  final NeteaseCloudLoginState newState = state.clone();
  if (action.payload.length > 0) {
    newState.password = true;
  } else {
    newState.password = false;
  }
  return newState;
}

NeteaseCloudLoginState _setPhone(NeteaseCloudLoginState state, Action action) {
  final NeteaseCloudLoginState newState = state.clone();
  if (action.payload.length > 0) {
    newState.phone = true;
  } else {
    newState.phone = false;
  }
  return newState;
}

NeteaseCloudLoginState _clearPasswordTextField(
    NeteaseCloudLoginState state, Action action) {
  final NeteaseCloudLoginState newState = state.clone();
  WidgetsBinding.instance
      .addPostFrameCallback((_) => newState.passwordContronller.text = '');
  newState.password = false;
  return newState;
}

NeteaseCloudLoginState _clearPhoneTextField(
    NeteaseCloudLoginState state, Action action) {
  final NeteaseCloudLoginState newState = state.clone();
  WidgetsBinding.instance
      .addPostFrameCallback((_) => newState.phoneContronller.text = '');
  newState.phone = false;
  return newState;
}

NeteaseCloudLoginState _onAction(NeteaseCloudLoginState state, Action action) {
  final NeteaseCloudLoginState newState = state.clone();
  return newState;
}
