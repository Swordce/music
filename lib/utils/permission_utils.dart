
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsUtils {

  static Future<bool> checkPermission(context,PermissionGroup permissionGroup) async {
    // 先对所在平台进行判断
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(permissionGroup);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([permissionGroup]);
        if (permissions[permissionGroup] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }


}