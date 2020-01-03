import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AudioPlayerUtils {

  static Future<int> getMusicDuration(AudioPlayer audioPlayer) async {
    var time = await audioPlayer.getDuration();
    return time;
  }

  static void play(AudioPlayer audioPlayer, musicUrl) async {
    if(audioPlayer == null || musicUrl == null) {
      return;
    }
    println(musicUrl);
//  Fluttertoast.showToast(msg: musicUrl);
    //切换swiper会多次调用，所以要切换时要先release
    if(audioPlayer.state != AudioPlayerState.PAUSED) {
      audioPlayer.release();
    }
    audioPlayer.play(musicUrl);

  }

  static void pause(audioPlayer) async {
    int result = await audioPlayer.pause();
    if (result != 1) {
      Fluttertoast.showToast(msg: '暂停失败');
    }
  }

  static void seek(audioPlayer, int startMilliseconds) async {
    int result =
        await audioPlayer.seek(new Duration(milliseconds: startMilliseconds));
  }
}
