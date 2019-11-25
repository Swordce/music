import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/home/page.dart';
import 'package:music/pages/login/page.dart';
import 'package:music/pages/splash/page.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page':SplashPage(),
      'login_page':LoginPage(),
      'home_page':HomePage(),
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
