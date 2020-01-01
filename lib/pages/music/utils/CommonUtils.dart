
import 'package:common_utils/common_utils.dart';
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

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  static String formatDateMs(int milliseconds,
      {bool isUtc = false, String format}) {
    return formatDate(getDateTimeByMs(milliseconds, isUtc: isUtc),
        format: format);
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMs(int milliseconds, {bool isUtc = false}) {
    return milliseconds == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }



  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  static String formatDate(DateTime dateTime, {bool isUtc, String format}) {
    if (dateTime == null) return "";
    format = format ?? DataFormats.full;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

}