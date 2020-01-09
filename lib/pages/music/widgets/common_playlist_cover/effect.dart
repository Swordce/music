import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/utils/file_download_utils.dart';
import 'package:music/utils/file_utils.dart';
import 'package:music/utils/permission_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'action.dart';
import 'state.dart';

Effect<CommonMusicCoverState> buildEffect() {
  return combineEffects(<Object, Effect<CommonMusicCoverState>>{
    CommonMusicCoverAction.action: _onAction,
    CommonMusicCoverAction.saveCover:_onSaveCover,
  });
}

void _onAction(Action action, Context<CommonMusicCoverState> ctx) {
}

void _onSaveCover(Action action, Context<CommonMusicCoverState> ctx) async {
  bool permisssonsResult =  await PermissionsUtils.checkPermission(ctx.context, PermissionGroup.storage);
  if(permisssonsResult) {
    String path = await FileUtils.getSavePath(ctx.context,'images');
    println('path========================================$path');
    String taskId = await FileDownloadUtil.singleFileDownload(ctx.state.coverImageUrl, path);
//    FileDownloadUtil.downCallback(taskId, path);
  }else{
    Fluttertoast.showToast(msg: '暂无存储权限，保存失败');
  }
}

