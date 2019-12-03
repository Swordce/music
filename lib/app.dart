import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/home/page.dart';
import 'package:music/pages/netease_cloud/music/page.dart';
import 'package:music/pages/netease_cloud/welfare/page.dart';
import 'package:music/pages/pre_login/page.dart';
import 'package:music/pages/splash/page.dart';

import 'pages/netease_cloud/login/page.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page':SplashPage(),
      'pre_login_page':PreLoginPage(),
      'login_page':NeteaseCloudLoginPage(),
      'home_page':HomePage(),
      'music_page':MusicPage(),
      'wefare_page':WelfarePage(),
      'mv_page':WelfarePage(),
    },
  );

  return MaterialApp(
    title: 'MusicDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('splash_page', null), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
