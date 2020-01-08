import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
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
    Lifecycle.dispose: _onDispose,
    PlaylistDetailAction.changeMusic: _onChangeMusic,
    PlaylistDetailAction.loadMusicUrl: _loadMusicUrl,
    PlaylistDetailAction.updateMusicPlayList: _onUpdateMusicPlayList,
    PlaylistDetailAction.updateIndex: _updateGlobalIndex,
    PlaylistDetailAction.jumpToComment: _onJumpToComment,
    PlaylistDetailAction.jumpToMusicCover: _onJumpToMusiCover,
  });
}

void _onDispose(Action action, Context<PlaylistDetailState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(true));
}

void _updateGlobalIndex(Action action, Context<PlaylistDetailState> ctx) {
  GlobalStore.store
      .dispatch(GlobalActionCreator.onUpdateCurrentPage(action.payload));
}

//获取音乐url
void _loadMusicUrl(Action action, Context<PlaylistDetailState> ctx) async {
  MusicUrlEntity entity =
      await NeteaseCloudNetUtils.getMusicUrl(action.payload['id']);
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

///更改当前播放的歌曲
void _onChangeMusic(Action action, Context<PlaylistDetailState> ctx) {
  //更改播放歌单为当前歌单
  if (ctx.state.currentPlaylistId != ctx.state.playlistId) {
    _onUpdateGlobalMusicList(ctx.state.music);
  }

  //播放控件未展示，直接点击歌单列表进行播放，需要先初始化swiperIndex
  if (ctx.state.swiperStartIndex == 0 && action.payload['index'] > 0) {
//    ctx.dispatch(PlaylistDetailActionCreator.onInitSwiperIndex(action.payload['index']));
    GlobalStore.store.dispatch(
        GlobalActionCreator.onInitSwiperIndex(action.payload['index']));
  }

  //修改全局正在播放的歌曲
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeMusic(action.payload));

  ctx.state.swiperController.move(action.payload['index']);
}

void _onInit(Action action, Context<PlaylistDetailState> ctx) async {
  initSwiperIndex(action, ctx);
  _onLoadPlaylist(action, ctx);
}

///初始化swiperIndex
void initSwiperIndex(Action action, Context<PlaylistDetailState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onIsBackToMain(false));
  GlobalStore.store
      .dispatch(GlobalActionCreator.onInitSwiperIndex(ctx.state.currentIndex));
}

///加载歌单列表
void _onLoadPlaylist(Action action, Context<PlaylistDetailState> ctx) async {
  println(ctx.state.playlistId);
  PlayListDetailEntity entity =
      await NeteaseCloudNetUtils.getPlaylistDetail(ctx.state.playlistId);

  if (entity != null) {
    MusicModel musicModel = _getMusicModel(entity.playlist); //将歌单详情转化为通用model
    if (ctx.state.globalMusic == null) {
      _onUpdateGlobalMusicList(musicModel);
    }
    ctx.dispatch(PlaylistDetailActionCreator.onLoadPlayList(musicModel));
    onChangePlayinglist(musicModel, ctx);
  }
}

void onChangePlayinglist(
    MusicModel musicModel, Context<PlaylistDetailState> ctx) async {
  if (ctx.state.playlistId != ctx.state.currentPlaylistId) {
    String ids = '';
    for (int i = 0; i < musicModel.musicList.length; i++) {
      ids = ids + '${musicModel.musicList[i].musicId},';
    }
    if (ids.length > 0) {
      ids = ids.substring(0, ids.length - 1);
      if (ids.isNotEmpty) {
        MusicUrlEntity urlEntity = await NeteaseCloudNetUtils.getMusicUrl(ids);
        if (urlEntity != null) {
          MusicModel models = updateMusicUrlList(urlEntity.data, musicModel);
          if (ctx.state.globalMusic == null) {
            _onUpdateGlobalMusicList(models);
          }
          ctx.dispatch(PlaylistDetailActionCreator.onLoadPlayList(models));
        }
      }
    }
  }
}

///更新播放列表的url
MusicModel updateMusicUrlList(List<MusicUrlData> data, MusicModel model) {
  model.musicList.forEach((item) {
    data.forEach((item2) {
      if (item.musicId == item2.id.toString()) {
        item.musicUrl = item2.url;
      }
    });
  });
  return model;
}

///更新播放列表
void _onUpdateMusicPlayList(Action action, Context<PlaylistDetailState> ctx) {
  _onUpdateGlobalMusicList(action.payload);
}

void _onUpdateGlobalMusicList(MusicModel playlist) {
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
  List<String>tags = [];
  tags.addAll(music.tags);

  return MusicModel(
      music.id.toString(),
      coverImgUrl,
      title,
      avatarUrl,
      nickname,
      description,
      playCount,
      commentCount,
      shareCount,
      trackCount,
      modelList,tags);
}

void _onJumpToComment(Action action, Context<PlaylistDetailState> ctx) {
  Navigator.of(ctx.context).pushNamed('common_comment_page', arguments: {
    'playlistId': ctx.state.music.playlistId,
    'coverImageUrl': ctx.state.music.coverImgUrl,
    'nickName': ctx.state.music.nickname,
    'title': ctx.state.music.title,
    'commentCount':ctx.state.music.commentCount
  });
}

void _onJumpToMusiCover(Action action, Context<PlaylistDetailState> ctx) {
  Navigator.of(ctx.context).pushNamed('common_music_cover', arguments: {
    'coverImageUrl': ctx.state.music.coverImgUrl,
    'tags': ctx.state.music.tags,
    'title': ctx.state.music.title,
    'description':ctx.state.music.description
  });
}


void _onAction(Action action, Context<PlaylistDetailState> ctx) {}
