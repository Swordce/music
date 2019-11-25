import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xFFDC2C1F),
    body: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 300),
          child: Image.asset(
            'images/icon_logo.png',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 230),
          child: Container(
            width: 250,
            height: 45,
            child: RaisedButton(
              color: Colors.white,
              shape: StadiumBorder(),
              textColor: Colors.red,
              child: Text(
                '立即登录',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {},
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 160),
          child: Container(
            width: 250,
            height: 45,
            child: OutlineButton(
              borderSide: BorderSide(
                color: Colors.white
              ),
              shape: StadiumBorder(),
              textColor: Colors.white,
              child: Text(
                '立即体验',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                dispatch(LoginActionCreator.onSkipLogin());
              },
            ),
          ),
        ),
      ],
    ),
  );
}
