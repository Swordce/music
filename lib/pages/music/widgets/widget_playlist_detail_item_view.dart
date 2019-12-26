import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';

class PlaylistDetailItemView extends StatelessWidget {
  final int index;
  final String currentPlaylistId;//当前正在播放的歌单，用于区分是否更新全局store中的歌单
  final MusicModel music;
  final bool showPlayView;//是否展示播放view
  final Dispatch dispatch;

  PlaylistDetailItemView(
      {Key key, this.index, this.music, this.currentPlaylistId, this.showPlayView,this.dispatch, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25, right: 20),
            child: Text(
              (index+1).toString(),
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  dispatch(PlaylistDetailActionCreator.onChangeMusic({
                    'index':index,
                    'showPlayView':true,
                    'isPlaying':false,
                  }));
                  if(currentPlaylistId != music.playlistId) {
                    dispatch(PlaylistDetailActionCreator.onUpdateMusicPlayList(music));
                  }
                  showPlayView??dispatch(PlaylistDetailActionCreator.onLoadMusicUrl({'id':music.musicList[index].musicId,'index':index}));
                },
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
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    )
                  ],
                ),
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
    );
  }
}
