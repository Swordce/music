import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:music/pages/music/utils/audio_player_utils.dart';
import 'package:music/store/action.dart';
import 'package:music/store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<MainPageState> buildEffect() {
  return combineEffects(<Object, Effect<MainPageState>>{
    MainPageAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onDispose(Action action, Context<MainPageState> ctx) {
  ctx.state.animationController.dispose();
  ctx.state.audioPlayer.dispose();
  ctx.state.swiperController.dispose();
}

void _onInit(Action action, Context<MainPageState> ctx) {
  final Object ticker = ctx.stfState;
  ctx.state.animationController = AnimationController(
      vsync: ticker, duration: Duration(milliseconds: 5000));
  ctx.state.animationController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      ctx.state.animationController.reset();
      ctx.state.animationController.forward();
    }
  });
  ctx.state.animationController.forward();
  _initAuidoPlayer(action, ctx);
}

///初始化音频播放器
void _initAuidoPlayer(Action action, Context<MainPageState> ctx) {
  ctx.state.audioPlayer = AudioPlayer();
  ctx.state.audioPlayer.onPlayerStateChanged.listen((state){
    if(state == AudioPlayerState.PLAYING) {
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdatePlayStatus({'isPlaying':true}));
    }else if(state == AudioPlayerState.PAUSED) {
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdatePlayStatus({'isPlaying':false}));
    }else if(state == AudioPlayerState.COMPLETED) {
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdatePlayStatus({'isPlaying':true}));
      ctx.state.swiperController.next();
    }
  });


  ctx.state.audioPlayer.onAudioPositionChanged.listen((p) async {
    // p参数可以获取当前进度，也是可以调整的，比如p.inMilliseconds
    int duration =
        await AudioPlayerUtils.getMusicDuration(ctx.state.audioPlayer);
    double progress = p.inMilliseconds / duration;
    GlobalStore.store.dispatch(
        GlobalActionCreator.onUpdateProgress({'playProgress': progress}));
  });

  GlobalStore.store.dispatch(
      GlobalActionCreator.updateAudioPlayer({'audioPlayer': ctx.state.audioPlayer,'swiperController':SwiperController()}));
}

void _onAction(Action action, Context<MainPageState> ctx) {}
