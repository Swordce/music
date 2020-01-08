import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/main_page/page.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/page.dart';
import 'package:music/pages/music/page.dart';
import 'package:music/pages/music/widgets/common_comment/page.dart';
import 'package:music/pages/music/widgets/common_comment_replied/page.dart';
import 'package:music/pages/music/widgets/common_playing_music/page.dart';
import 'package:music/pages/music/widgets/common_playlist_center/page.dart';
import 'package:music/pages/music/widgets/common_playlist_center_item/page.dart';
import 'package:music/pages/music/widgets/common_rank/page.dart';
import 'package:music/pages/pre_login/page.dart';
import 'package:music/pages/splash/page.dart';
import 'package:music/pages/test/page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      'playing_music_page': PlayingMusicPage(),
      'playlist_center_page': PlaylistCenterPage(),
      'playlist_center_item_page': PlaylistCenterItemPage(),
      'test_page': TestPagePage(),
      'common_rank_page': RankPage(),
      'common_comment_page': CommentPage(),
      'common_comment_replied_page': CommentRepliedPage(),
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
          if (p.showPlayView != appState.showPlayView ||
              p.isPlaying != appState.isPlaying ||
              p.playProgress != appState.playProgress ||
              p.globalMusic != appState.globalMusic ||
              p.currentIndex != appState.currentIndex ||
              p.currentPlaylistId != appState.currentPlaylistId ||
              p.audioPlayer != appState.audioPlayer ||
              p.swiperController != appState.swiperController ||
              p.currentPlayingStyle != appState.currentPlayingStyle ||
              p.playTime != appState.playTime ||
              p.duration != appState.duration ||
              p.playlistCenterBgImageUrl != appState.playlistCenterBgImageUrl ||
              p.bgImageUrl != appState.bgImageUrl ||
              p.isInitSwiperIndex != appState.isInitSwiperIndex ||
              p.swiperStartIndex != appState.swiperStartIndex ||
              p.pageIndex != appState.pageIndex ||
              p.isBackToMain != appState.isBackToMain) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final BaseGlobalState newState = copy;
              newState.showPlayView = appState.showPlayView;
              newState.isPlaying = appState.isPlaying;
              newState.playProgress = appState.playProgress;
              newState.globalMusic = appState.globalMusic;
              newState.currentIndex = appState.currentIndex;
              newState.currentPlaylistId = appState.currentPlaylistId;
              newState.audioPlayer = appState.audioPlayer;
              newState.swiperController = appState.swiperController;
              newState.currentPlayingStyle = appState.currentPlayingStyle;
              newState.playTime = appState.playTime;
              newState.duration = appState.duration;
              newState.playlistCenterBgImageUrl =
                  appState.playlistCenterBgImageUrl;
              newState.bgImageUrl = appState.bgImageUrl;
              newState.isInitSwiperIndex = appState.isInitSwiperIndex;
              newState.swiperStartIndex = appState.swiperStartIndex;
              newState.pageIndex = appState.pageIndex;
              newState.isBackToMain = appState.isBackToMain;
              return newState;
            }
          }
          return pagestate;
        });
      }
    },
  );

  return RefreshConfiguration(
    headerBuilder: () => ClassicHeader(),
    footerBuilder: () => CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载更多");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("release to load more");
        } else {
          body = Text("没有更多了~");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    ),
    child: MaterialApp(
      title: 'MusicDemo',
      theme: ThemeData(
          primarySwatch: Colors.blue, canvasColor: Colors.transparent),
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
    ),
  );
}
