import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NeteaseCloudLoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xFFFFFFFF),
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        '手机号登录',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
    body: Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 20, top: 45, right: 0, bottom: 0),
            child: Text(
              '未注册手机号登录后将自动创建账号',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            )),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 50, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 45, right: 0, bottom: 0),
                    child: Text(
                      '+86',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, top: 45, right: 20, bottom: 0),
                      child: TextField(
                        controller: state.phoneContronller,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        onChanged: (text) {
                          dispatch(NeteaseCloudLoginActionCreator.onSetPhone(text));
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入手机号',
                            hintStyle: TextStyle(
                              fontSize: 18,
                            ),
                            suffixIcon: state.phone? IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.black26,
                                    ),
                                    onPressed: () {
                                      dispatch(NeteaseCloudLoginActionCreator
                                          .onClearPhoneTextField());
                                    },
                                  )
                                : null),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 0, right: 0, bottom: 0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 0, top: 25, right: 20, bottom: 0),
                      child: TextField(
                        controller: state.passwordContronller,
                        cursorColor: Colors.red,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        onChanged: (text) {
                          dispatch(NeteaseCloudLoginActionCreator.onSetPassword(text));
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '请输入密码',
                            hintStyle: TextStyle(
                              fontSize: 18,
                            ),
                            suffixIcon: state.password
                                ? IconButton(
                                    icon: Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.black26,
                                    ),
                                    onPressed: () {
                                      dispatch(NeteaseCloudLoginActionCreator
                                          .onClearPasswordTextField());
                                    },
                                  )
                                : null),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: ScreenUtil().width,
              height: 45,
              margin: EdgeInsets.fromLTRB(20, 45, 20, 0),
              child: RaisedButton(
                color: Colors.red,
                shape: StadiumBorder(),
                textColor: Colors.white,
                child: Text(
                  '登    录',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  dispatch(NeteaseCloudLoginActionCreator.onLogin());
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
