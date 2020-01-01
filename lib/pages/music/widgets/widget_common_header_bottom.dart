import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/playlist_detail/action.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';

class CommonPlaylistHeaderBottomView extends StatelessWidget
    implements PreferredSizeWidget {
  CommonPlaylistHeaderBottomView({this.count, this.dispatch, this.musicModel, this.audioPlayer, this.showBottomView});

  final Dispatch dispatch;
  final int count;
  final MusicModel musicModel;
  final AudioPlayer audioPlayer;
  final bool showBottomView;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: SizedBox.fromSize(
              size: preferredSize,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    child: Image.asset(
                      'assets/images/icon_play.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 5.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        "全部歌曲",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: count == null
                        ? Container()
                        : Text(
                            "(共$count首)",
                          ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
