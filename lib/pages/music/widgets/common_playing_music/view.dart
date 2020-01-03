import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/utils/CommonUtils.dart';
import 'package:music/store/state.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PlayingMusicState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: state.globalMusic.musicList[state.currentIndex].musicImgUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 80,
            sigmaX: 80,
          ),
          child: Container(
            color: Colors.black38,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
          AppBar(
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  state.globalMusic.musicList[state.currentIndex].musicName,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Container(
                  height: 2,
                ),
                Text(
                  state.globalMusic.musicList[state.currentIndex].musicSoner,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: RotationTransition(
                      turns: Tween<double>(begin: 0, end: 1)
                          .animate(state.animationController),
                      child: CachedNetworkImage(
                        imageUrl: state.globalMusic
                            .musicList[state.currentIndex].musicImgUrl,
                        width: 240,
                        height: 240,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/icon_dislike.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/icon_song_download.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/icon_song_comment.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/icon_song_more.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    CommonUtils.formatDateMs(state.playTime, format: "mm:ss"),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 1,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 3,
                        ),
                      ),
                      child: Slider(
                        value:
                            (state.playProgress >= 0 && state.playProgress <= 1)
                                ? state.playProgress
                                : 1,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white12,
                        min: 0,
                        max: 1,
                        onChanged: (data) {},
                      ),
                    ),
                  ),
                  Text(
                    CommonUtils.formatDateMs(state.duration, format: "mm:ss"),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        dispatch(PlayingMusicActionCreator.onPlayingOrder());
                      },
                      child: (state.currentPlayingStyle ==
                              BaseGlobalState.PLAING_ORDER)
                          ? Image.asset(
                              'assets/images/icon_song_play_type_1.png',
                              width: 50,
                              height: 50,
                            )
                          : (state.currentPlayingStyle ==
                                  BaseGlobalState.PLAYING_RANDOM)
                              ? Image.asset(
                                  'assets/images/icon_songs_random.png',
                                  width: 50,
                                  height: 50,
                                )
                              : Image.asset(
                                  'assets/images/icon_songs_circle.png',
                                  width: 50,
                                  height: 50,
                                ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        dispatch(PlayingMusicActionCreator.onPreviousMusic());
                      },
                      child: Image.asset(
                        'assets/images/icon_song_left.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        dispatch(PlayingMusicActionCreator.onPlayingState());
                      },
                      child: state.isPlaying
                          ? Image.asset(
                              'assets/images/icon_song_pause.png',
                              width: 80,
                              height: 80,
                            )
                          : Image.asset(
                              'assets/images/icon_song_play.png',
                              width: 80,
                              height: 80,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        dispatch(PlayingMusicActionCreator.onNextMusic());
                      },
                      child: Image.asset(
                        'assets/images/icon_song_right.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/icon_play_songs.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
