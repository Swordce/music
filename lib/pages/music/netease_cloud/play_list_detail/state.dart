import 'package:fish_redux/fish_redux.dart';

class PlayListState implements Cloneable<PlayListState> {

  String playListId;//歌单id

  @override
  PlayListState clone() {
    return PlayListState()
    ..playListId = playListId;
  }
}

PlayListState initState(Map<String, dynamic> args) {
  PlayListState state = PlayListState();
  state.playListId = args['playListId'];
  return state;
}
