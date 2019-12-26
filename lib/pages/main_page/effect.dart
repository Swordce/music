import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
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
}

void _onAction(Action action, Context<MainPageState> ctx) {}
