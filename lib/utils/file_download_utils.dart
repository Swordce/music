
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FileDownloadUtil {

  static void downCallback(taskId,savePath) {
    FlutterDownloader.registerCallback((id,status,progress){
      if((taskId == id) && (status == DownloadTaskStatus.complete)) {
        Fluttertoast.showToast(msg: '文件已保存到$savePath中');
      }else if(DownloadTaskStatus.failed == status) {
        Fluttertoast.showToast(msg: '下载失败');
      }
    });
  }

  static Future<String> singleFileDownload(String url,String savePath) async {
    String taskId = await FlutterDownloader.enqueue(url: url, savedDir: savePath,showNotification: false,openFileFromNotification: false);
    return taskId;
  }

  static cancelSingleDownloadTask(String taskId) {
    FlutterDownloader.cancel(taskId: taskId);
  }
}