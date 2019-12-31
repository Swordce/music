import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GlobalBottomPlayView extends StatelessWidget {
  final bool isPlaying;
  final double playPercent;
  final MusicModel globalMusic;
  int initIndex = 0;
  final int startIndex;
  final SwiperController swiperController;
  final AudioPlayer audioPlayer;
  final Dispatch dispatch;
  final BuildContext context;
  bool isInit = false;
  int currentIndex = 0;

  GlobalBottomPlayView({
    Key key,
    this.isInit,
    this.initIndex,
    this.isPlaying,
    this.playPercent,
    this.globalMusic,
    this.swiperController,
    this.dispatch,
    this.audioPlayer,
    this.context,
    this.startIndex,
  }) : super(key: key);

  Widget _buildItem(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(globalMusic
                          .musicList[index].musicImgUrl ==
                      null
                  ? "http://p1.music.126.net/rQ72PIOhMUosTrFcH0j8uQ==/109951164106511339.jpg"
                  : globalMusic.musicList[index].musicImgUrl),
              radius: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      globalMusic.musicList[index].musicName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        globalMusic.musicList[index].musicSoner,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (audioPlayer.state == AudioPlayerState.PAUSED) {
                  AudioPlayerUtils.play(
                      audioPlayer, globalMusic.musicList[index].musicUrl);
                } else {
                  AudioPlayerUtils.pause(audioPlayer);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 20),
                child: CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 1.5,
                  percent: (playPercent == null ||
                          playPercent > 1 ||
                          playPercent < 0)
                      ? 0
                      : playPercent,
                  center: Image.asset(
                    isPlaying
                        ? 'assets/images/pause.png'
                        : 'assets/images/play.png',
                    width: 20,
                    height: 20,
                  ),
                  backgroundColor: Colors.black38,
                  progressColor: Colors.red,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/list.png',
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 60,
          child: new Swiper(
            controller: swiperController,
            itemCount: globalMusic.musicList.length,
            index: isInit ? initIndex : currentIndex,
//            physics:NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(index);
            },
            onIndexChanged: (index) {
              currentIndex = index;
              dispatch(PlaylistDetailActionCreator.onIsInitWidget({'isInitWidget':true,'playingIndex':index}));
              String url = globalMusic.musicList[index].musicUrl;
              if (url != null) {
                AudioPlayerUtils.play(
                    audioPlayer, globalMusic.musicList[index].musicUrl);
              } else {
                dispatch(PlaylistDetailActionCreator.onLoadMusicUrl({
                  'id': globalMusic.musicList[index].musicId,
                  'index': index
                }));
              }
            },
          )),
    );
  }
}
