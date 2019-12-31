import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:music/pages/music/netease_cloud/model/music_url_entity.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';

import 'action.dart';
import 'state.dart';

Effect<CommonPlaylistState> buildEffect() {
  return combineEffects(<Object, Effect<CommonPlaylistState>>{
    CommonPlaylistAction.action: _onAction,
    CommonPlaylistAction.loadMusicUrl: _loadMusicUrl,
  });
}


//获取音乐url
void _loadMusicUrl(Action action, Context<CommonPlaylistState> ctx) async {
  MusicUrlEntity entity =
  await NeteaseCloudNeteaseUtils.getMusicUrl(action.payload['id']);
  if (entity != null) {
    String url = entity.data[0].url;
    GlobalStore.store.dispatch(GlobalActionCreator.onLoadMusicUrl(
        {'musicUrl': url, 'index': action.payload['index']}));
    if (url == null || url.isEmpty) {
      ctx.state.swiperController.next();
      return;
    }
    AudioPlayerUtils.play(ctx.state.audioPlayer, url);
  }
}

void _onAction(Action action, Context<CommonPlaylistState> ctx) {
}
