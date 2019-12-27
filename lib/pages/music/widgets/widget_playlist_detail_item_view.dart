import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';

class PlaylistDetailItemView extends StatelessWidget {
  final int index;
  final String currentPlaylistId; //当前正在播放的歌单，用于区分是否更新全局store中的歌单
  final MusicModel music;
  final bool showPlayView; //是否展示播放view
  final AudioPlayer audioPlayer;
  final Dispatch dispatch;

  PlaylistDetailItemView({
    Key key,
    this.index,
    this.music,
    this.currentPlaylistId,
    this.showPlayView,
    this.dispatch, this.audioPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            if(!showPlayView) {
              String url = music.musicList[index].musicUrl;
              if(url != null) {
                AudioPlayerUtils.play(audioPlayer, music.musicList[index].musicUrl);
              }
            }
            dispatch(PlaylistDetailActionCreator.onChangeMusic({
              'currentPlaylistId': music.playlistId,
              'index': index,
              'showPlayView': true,
              'isPlaying': false,
            }));
          },
          child: Row(
            children: <Widget>[
              Container(
                width: 30,
                margin: EdgeInsets.only(left: 15, right: 25),
                child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        music.musicList[index].musicName,
                        maxLines: 1,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '${music.musicList[index].musicSoner}-${music.musicList[index].musicAlbumName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ));
  }
}
