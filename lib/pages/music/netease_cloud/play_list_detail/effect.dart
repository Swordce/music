import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/netease_cloud/model/user_model.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayListState> buildEffect() {
  return combineEffects(<Object, Effect<PlayListState>>{
    PlayListAction.action: _onAction,
    Lifecycle.initState:_onInit,
  });
}

void _onInit(Action action, Context<PlayListState> ctx) async {
  PlayListDetailEntity entity = await NeteaseCloudUserModel.getPlayListDetail(ctx.state.playListId);
  if(entity != null) {
    ctx.dispatch(PlayListActionCreator.onLoadPlayList(entity.playlist));
  }
}

void _onAction(Action action, Context<PlayListState> ctx) {
}
