import 'package:fish_redux/fish_redux.dart';

class MusicState implements Cloneable<MusicState> {

  @override
  MusicState clone() {
    return MusicState();
  }
}

MusicState initState(Map<String, dynamic> args) {
  return MusicState();
}
