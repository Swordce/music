import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:music/store/action.dart';
import 'package:music/store/state.dart';
import 'package:music/store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<PlayingMusicState> buildEffect() {
  return combineEffects(<Object, Effect<PlayingMusicState>>{
    PlayingMusicAction.action: _onAction,
    PlayingMusicAction.previousMusic: _onPreviousMusic,
    PlayingMusicAction.nextMusic: _onNextMusic,
    PlayingMusicAction.playingState: _onPlayingState,
    PlayingMusicAction.playingOrder: _onPlayingOrder,
    Lifecycle.dispose: _onDispose,
    Lifecycle.initState: _onInit,
  });
}

void _onInit(Action action, Context<PlayingMusicState> ctx) {
  final Object ticker = ctx.stfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 50000));
  ctx.state.animationController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      ctx.state.animationController.reset();
      ctx.state.animationController.forward();
    }
  });
  ctx.state.animationController.forward();
}

void _onDispose(Action action, Context<PlayingMusicState> ctx) {
  ctx.state.animationController.dispose();
}

void _onPreviousMusic(Action action, Context<PlayingMusicState> ctx) {
  if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAING_ORDER) {
    int index = ctx.state.currentIndex - 1;
    if (index < 0) {
      index = ctx.state.globalMusic.musicList.length - 1;
    }
    _playMusic(index, ctx);
  } else if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAYING_RANDOM) {
    var random = Random();
    int index = random.nextInt(ctx.state.globalMusic.musicList.length);
    _playMusic(index, ctx);
  } else {
    AudioPlayerUtils.play(ctx.state.audioPlayer,
        ctx.state.globalMusic.musicList[ctx.state.currentIndex].musicUrl);
  }
}

void _playMusic(int index, Context<PlayingMusicState> ctx) {
  var musicUrl = ctx.state.globalMusic.musicList[index].musicUrl;
  AudioPlayerUtils.play(ctx.state.audioPlayer, musicUrl);
  GlobalStore.store
      .dispatch(GlobalActionCreator.onUpdateCurrentPage({'index': index}));
}

void _onNextMusic(Action action, Context<PlayingMusicState> ctx) {
  if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAING_ORDER) {
    int index = ctx.state.currentIndex + 1;
    if (index > (ctx.state.globalMusic.musicList.length - 1)) {
      index = 0;
    }
    _playMusic(index, ctx);
  } else if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAYING_RANDOM) {
    var random = Random();
    int index = random.nextInt(ctx.state.globalMusic.musicList.length);
    _playMusic(index, ctx);
  } else {
    AudioPlayerUtils.play(ctx.state.audioPlayer,
        ctx.state.globalMusic.musicList[ctx.state.currentIndex].musicUrl);
  }
}

void _onPlayingState(Action action, Context<PlayingMusicState> ctx) {
  if (ctx.state.audioPlayer.state == AudioPlayerState.PAUSED) {
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdatePlayStatus({'isPlaying': true}));
    AudioPlayerUtils.play(ctx.state.audioPlayer,
        ctx.state.globalMusic.musicList[ctx.state.currentIndex].musicUrl);
  } else {
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdatePlayStatus({'isPlaying': false}));
    AudioPlayerUtils.pause(ctx.state.audioPlayer);
  }
}

void _onPlayingOrder(Action action, Context<PlayingMusicState> ctx) {
  var style = BaseGlobalState.PLAING_ORDER;
  if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAING_ORDER) {
    style = BaseGlobalState.PLAYING_RANDOM;
  } else if (ctx.state.currentPlayingStyle == BaseGlobalState.PLAYING_RANDOM) {
    style = BaseGlobalState.PLAYING_CYCLE;
  } else {
    style = BaseGlobalState.PLAING_ORDER;
  }
  GlobalStore.store.dispatch(GlobalActionCreator.onUpdatePlayingStyle(style));
}

void _onAction(Action action, Context<PlayingMusicState> ctx) {}
