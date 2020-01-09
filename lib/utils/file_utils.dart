import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> getSavePath(context, dirName) async {
    Directory directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    Directory dir = Directory(directory.path + '/$dirName');
    bool exists = await dir.exists();
    if (!exists) {
      dir.create();
    }
    return dir.path;
  }
}
