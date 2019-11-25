import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return Material(
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'images/welcome.png',
          fit: BoxFit.fill,
        ),
        Container(
          alignment: AlignmentDirectional.bottomEnd,
          margin: EdgeInsets.fromLTRB(0, 0, 20, 65),
          child: OutlineButton(
            borderSide: BorderSide(
              color: Colors.white
            ),
            shape: StadiumBorder(),
            child: Text(
              state.time.toString(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              dispatch(SplashActionCreator.onJumpToLogin());
            },
          ),
        ),
      ],
    ),
  );
}
