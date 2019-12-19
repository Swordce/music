import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/state.dart';

class XiamiMusicState implements Cloneable<XiamiMusicState> {

  @override
  XiamiMusicState clone() {
    return XiamiMusicState();
  }
}

class XiamiMusicConnector extends ConnOp<MusicState,XiamiMusicState> {

  @override
  XiamiMusicState get(MusicState state) {
    return XiamiMusicState();
  }
}
