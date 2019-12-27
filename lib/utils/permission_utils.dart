
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsUtils {

  static Future<bool> requestPermission(BuildContext context,permisssion) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    if(permissions[PermissionGroup.storage] != PermissionStatus.granted){
      return false;
    }

    return true;

//    // 申请结果  权限检测
//    PermissionStatus permission =
//    await PermissionHandler().checkPermissionStatus(permisssion);
//
//    if (permission == PermissionStatus.granted) {
//      return true;
//    } else {
//      return false;
//    }
  }

}