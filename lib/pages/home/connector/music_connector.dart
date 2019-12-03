
import 'package:fish_redux/fish_redux.dart';
import 'package:music/pages/home/state.dart';
import 'package:music/pages/netease_cloud/music/state.dart';

class MusicConnector extends Reselect<HomeState,MusicState> {
  @override
  MusicState computed(List list) {
    // TODO: implement computed
    return MusicState();
  }

  @override
  List getSubs(HomeState state) {
    // TODO: implement getSubs
    return null;
  }

  @override
  void set(HomeState state, MusicState subState) {
    // TODO: implement set
  }

}