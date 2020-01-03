import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:music/pages/music/widgets/common_playing_music/action.dart';
import 'package:music/pages/music/widgets/common_playlist/action.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'state.dart';

Widget buildView(CommonPlaylistState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildItem(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(state.globalMusic
                  .musicList[index].musicImgUrl ==
                  null
                  ? "http://p1.music.126.net/rQ72PIOhMUosTrFcH0j8uQ==/109951164106511339.jpg"
                  : state.globalMusic.musicList[index].musicImgUrl),
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
                      state.globalMusic.musicList[index].musicName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.normal,decoration: TextDecoration.none),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        state.globalMusic.musicList[index].musicSoner,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.black54,fontWeight: FontWeight.normal,decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (state.audioPlayer.state == AudioPlayerState.PAUSED) {
                  AudioPlayerUtils.play(
                      state.audioPlayer, state.globalMusic.musicList[index].musicUrl);
                } else {
                  AudioPlayerUtils.pause(state.audioPlayer);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 20),
                child: CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 1.5,
                  percent: (state.playProgress == null ||
                      state.playProgress > 1 ||
                      state.playProgress < 0)
                      ? 0
                      : state.playProgress,
                  center: Image.asset(
                    state.isPlaying
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

//  println('init inde==================${state.isInitSwiperIndex} ============= ${state.swiperStartIndex} ================= ${state.pageIndex}');
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        height: 60,
        child: new Swiper(
          controller: state.swiperController,
          itemCount: state.globalMusic.musicList.length,
          index: state.isInitSwiperIndex ? state.swiperStartIndex : state.pageIndex,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index);
          },
          onTap: (index){
            dispatch(CommonPlaylistActionCreator.onJumpToPlayingMusicPage());
          },
          onIndexChanged: (index) {
            println('1111111111');
            GlobalStore.store.dispatch(GlobalActionCreator.onUpdateCurrentPage({'index':index}));
            GlobalStore.store.dispatch(GlobalActionCreator.onIsInitWidget({'isInitWidget':false,'pageIndex':index}));
//            dispatch(PlaylistDetailActionCreator.onIsInitWidget({'isInitWidget':false,'pageIndex':index}));
            String url = state.globalMusic.musicList[index].musicUrl;
            if (url != null) {
              AudioPlayerUtils.play(
                  state.audioPlayer, state.globalMusic.musicList[index].musicUrl);
            } else {
              Fluttertoast.showToast(msg: '歌曲暂不可用');
              AudioPlayerUtils.pause(state.audioPlayer);
            }
          },
        )),
  );
}
