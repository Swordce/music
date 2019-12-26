
import 'package:sprintf/sprintf.dart';

class CommonUtils {

  ///格式化播放量
  static String playCountFormat(int playCount) {
    String standardPlayCount = "";
    if (playCount < 0) {
      standardPlayCount = "0";
    } else if (playCount < 10000) {
      standardPlayCount = playCount.toString();
    } else if (playCount < 100000000) {
      standardPlayCount =
          sprintf("%d.%02d万", [playCount ~/ 10000, playCount % 10000 ~/ 100]);
    } else if (playCount > 100000000) {
      standardPlayCount = sprintf("%d.%02d亿",
          [playCount ~/ 100000000, playCount % 100000000 ~/ 1000000]);
    }
    return standardPlayCount;
  }
}