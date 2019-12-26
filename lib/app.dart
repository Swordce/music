import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/main_page/page.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/page.dart';
import 'package:music/pages/music/page.dart';
import 'package:music/pages/pre_login/page.dart';
import 'package:music/pages/splash/page.dart';
import 'package:music/pages/test/page.dart';

import 'pages/music/netease_cloud/login/page.dart';
import 'store/state.dart';
import 'store/store.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page': SplashPage(),
      'pre_login_page': PreLoginPage(),
      'login_page': NeteaseCloudLoginPage(),
      'main_page': MainPagePage(),
      'music_page': MusicPage(),
      'playlist_detail_page': PlaylistDetailPage(),
      'test_page': TestPagePage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 满足条件 Page<T> ，T 是 GlobalBaseState 的子类。
      if (page.isTypeof<BaseGlobalState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store,
            (Object pagestate, GlobalState appState) {
          final BaseGlobalState p = pagestate;
          if ( p.showPlayView != appState.showPlayView ||
              p.isPlaying != appState.isPlaying ||
              p.playProgress != appState.playProgress ||
              p.globalMusic != appState.globalMusic ||
              p.currentIndex != appState.currentIndex || p.currentPlaylistId != appState.currentPlaylistId) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final BaseGlobalState newState = copy;
              newState.showPlayView = appState.showPlayView;
              newState.isPlaying = appState.isPlaying;
              newState.playProgress = appState.playProgress;
              newState.globalMusic = appState.globalMusic;
              newState.currentIndex = appState.currentIndex;
              newState.currentPlaylistId = appState.currentPlaylistId;
              return newState;
            }
          }
          return pagestate;
        });
      }
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
