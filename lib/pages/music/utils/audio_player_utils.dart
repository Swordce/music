import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AudioPlayerUtils {

  static Future<int> getMusicDuration(AudioPlayer audioPlayer) async {
    var time = await audioPlayer.getDuration();
    return time;
  }

  static void play(AudioPlayer audioPlayer, musicUrl) async {
    if(audioPlayer == null) {
      return;
    }
    int prepare = await audioPlayer.setUrl(musicUrl);
    if(prepare == 1) {
      int result = await audioPlayer.resume();
      if (result != 1) {
        Fluttertoast.showToast(msg: '播放失败');
      }
    }

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
