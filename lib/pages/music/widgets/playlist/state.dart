import 'package:fish_redux/fish_redux.dart';

class CommonPlaylistState implements Cloneable<CommonPlaylistState> {

  @override
  CommonPlaylistState clone() {
    return CommonPlaylistState();
  }
}

CommonPlaylistState initState(Map<String, dynamic> args) {
  return CommonPlaylistState();
}
