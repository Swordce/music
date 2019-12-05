import 'package:fish_redux/fish_redux.dart';

class MusicState implements Cloneable<MusicState> {
  Map<String,String> map;
  var keys;
  @override
  MusicState clone() {
    return MusicState();
  }
}

MusicState initState(Map<String, dynamic> args) {
  MusicState musicState = new MusicState();
  musicState.map = {
    '每日推荐': 'images/icon_daily.png',
    '歌单': 'images/icon_playlist.png',
    '排行榜': 'images/icon_rank.png',
    '电台': 'images/icon_radio.png',
  };
  musicState.keys = musicState.map.keys.toList();
  return musicState;
}
