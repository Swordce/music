import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/model/music_url_entity.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<PlaylistDetailState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistDetailState>>{
    PlaylistDetailAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
    PlaylistDetailAction.changeMusic: _onChangeMusic,
    PlaylistDetailAction.loadMusicUrl: _loadMusicUrl,
    PlaylistDetailAction.updateMusicPlayList: _onUpdateMusicPlayList,
  });
}

//获取音乐url
void _loadMusicUrl(Action action, Context<PlaylistDetailState> ctx) async {
  MusicUrlEntity entity =
      await NeteaseCloudNeteaseUtils.getMusicUrl(action.payload['id']);
  if (entity != null) {
    String url = entity.data[0].url;
    GlobalStore.store.dispatch(GlobalActionCreator.onLoadMusicUrl(
        {'musicUrl': url, 'index': action.payload['index']}));
  }
}

//更改播放控件的音乐名称等
void _onChangeMusic(Action action, Context<PlaylistDetailState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeMusic(action.payload));
  int index = ctx.state.currentIndex;
  ctx.state.swiperController.move(index);
}

//获取歌单详情
void _onInit(Action action, Context<PlaylistDetailState> ctx) async {
  PlayListDetailEntity entity =
      await NeteaseCloudNeteaseUtils.getPlayListDetail(ctx.state.playlistId);
  if (entity != null) {
    MusicModel musicModel = _getMusicModel(entity.playlist); //将歌单详情转化为通用model
    if (identical(ctx.state.currentPlaylistId, ctx.state.playlistId)) {
      _onUpdateGlobalMusicList(musicModel);
    }
    ctx.dispatch(PlaylistDetailActionCreator.onLoadPlayList(musicModel));
  }
  ctx.state.swiperController = SwiperController();
}

void _onUpdateMusicPlayList(Action action, Context<PlaylistDetailState> ctx) {
  _onUpdateGlobalMusicList(action.payload);
}

void _onUpdateGlobalMusicList(playlist) {
  GlobalStore.store.dispatch(GlobalActionCreator.onLoadPlayList(playlist));
}

void _onDispose(Action action, Context<PlaylistDetailState> ctx) {
  ctx.state.swiperController.dispose();
}

void _onAction(Action action, Context<PlaylistDetailState> ctx) {}

MusicModel _getMusicModel(PlayListDetailPlaylist music) {
  List<MusicListModel> modelList = [];
  for (int i = 0; i < music.tracks.length; i++) {
    MusicListModel model = MusicListModel(
        music.tracks[i].al.picUrl,
        '',
        music.tracks[i].name,
        music.tracks[i].ar[0].name,
        '',
        music.tracks[i].id.toString(),
        music.tracks[i].al.name);
    modelList.add(model);
  }
  var coverImgUrl = music.coverImgUrl;
  var title = music.name;
  var avatarUrl = music.creator.avatarUrl;
  var nickname = music.creator.nickname;
  var description = music.description;
  var playCount = music.playCount;
  var commentCount = music.commentCount;
  var shareCount = music.shareCount;
  var trackCount = music.trackCount;

  return MusicModel(music.id.toString(),coverImgUrl, title, avatarUrl, nickname, description,
      playCount, commentCount, shareCount, trackCount, modelList);
}
