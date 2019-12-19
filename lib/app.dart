import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/main_page/page.dart';
import 'package:music/pages/music/page.dart';
import 'package:music/pages/pre_login/page.dart';
import 'package:music/pages/splash/page.dart';
import 'package:music/pages/test/page.dart';

import 'pages/music/netease_cloud/login/page.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page':SplashPage(),
      'pre_login_page':PreLoginPage(),
      'login_page':NeteaseCloudLoginPage(),
      'main_page':MainPagePage(),
      'music_page':MusicPage(),
      'test_page':TestPagePage(),
    },
  );

  return MaterialApp(
    title: 'MusicDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('main_page', {
      'pages': [
        routes.buildPage('music_page', null),
        routes.buildPage('test_page', null),
        routes.buildPage('test_page', null),
        routes.buildPage('test_page', null)
      ]
    }), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
