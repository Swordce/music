import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';

class PlayListState implements Cloneable<PlayListState> {
  String playListId; //歌单id
  String copywriter; //歌单副标题
  PlayListDetailPlaylist detailPlaylist;

  @override
  PlayListState clone() {
    return PlayListState()
      ..playListId = playListId
      ..copywriter = copywriter
      ..detailPlaylist = detailPlaylist;
  }
}

PlayListState initState(Map<String, dynamic> args) {
  PlayListState state = PlayListState();
  state.playListId = args['playListId'];
  state.copywriter = args['copywriter'];
  return state;
}
