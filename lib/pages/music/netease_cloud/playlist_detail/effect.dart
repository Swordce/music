import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/music/model/common_music_model.dart';
import 'package:music/pages/music/netease_cloud/model/music_url_entity.dart';
import 'package:music/pages/music/netease_cloud/model/netease_network_utils.dart';
import 'package:music/pages/music/netease_cloud/model/play_list_detail_entity.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';

import 'action.dart';
import 'state.dart';

Effect<PlaylistDetailState> buildEffect() {
  return combineEffects(<Object, Effect<PlaylistDetailState>>{
    PlaylistDetailAction.action: _onAction,
    Lifecycle.initState: _onInit,
    PlaylistDetailAction.changeMusic: _onChangeMusic,
    PlaylistDetailAction.loadMusicUrl: _loadMusicUrl,
    PlaylistDetailAction.updateMusicPlayList: _onUpdateMusicPlayList,
    PlaylistDetailAction.updateIndex: _onUpdateIndex,
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
    if(url == null || url.isEmpty) {
      ctx.state.swiperController.next();
    }
    AudioPlayerUtils.play(ctx.state.audioPlayer, url);
  }
}

///更改当前播放的歌曲
void _onChangeMusic(Action action, Context<PlaylistDetailState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeMusic(action.payload));
  _onUpdateIndex(PlaylistDetailActionCreator.onUpdateIndex(action.payload['index']), ctx);
}

void _onInit(Action action, Context<PlaylistDetailState> ctx) async {
  _onLoadPlaylist(action, ctx);
}

///加载歌单列表
void _onLoadPlaylist(Action action, Context<PlaylistDetailState> ctx) async {
  PlayListDetailEntity entity =
      await NeteaseCloudNeteaseUtils.getPlaylistDetail(ctx.state.playlistId);
  if (entity != null) {
    MusicModel musicModel = _getMusicModel(entity.playlist); //将歌单详情转化为通用model
    if (!identical(ctx.state.currentPlaylistId, ctx.state.playlistId)) {
      _onUpdateGlobalMusicList(musicModel);
    }
    ctx.dispatch(PlaylistDetailActionCreator.onLoadPlayList(musicModel));
  }
}

///更新播放列表
void _onUpdateMusicPlayList(Action action, Context<PlaylistDetailState> ctx) {
  _onUpdateGlobalMusicList(action.payload);
}

void _onUpdateGlobalMusicList(playlist) {
  GlobalStore.store.dispatch(GlobalActionCreator.onLoadPlayList(playlist));
}

///网易云歌单转化为通用歌单
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

void _onUpdateIndex(Action action, Context<PlaylistDetailState> ctx) {
  ctx.state.swiperController.move(action.payload);
}


void _onAction(Action action, Context<PlaylistDetailState> ctx) {}

