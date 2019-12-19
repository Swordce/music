import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/state.dart';

class QQMusicState implements Cloneable<QQMusicState> {

  @override
  QQMusicState clone() {
    return QQMusicState();
  }
}

class QQMusicConnector extends ConnOp<MusicState,QQMusicState> {
  @override
  QQMusicState get(MusicState state) {
    return QQMusicState();
  }
}
