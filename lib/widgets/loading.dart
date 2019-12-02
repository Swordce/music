import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading {
  static bool isLoading = false;

  static void showLoading(BuildContext context,bool showLoading) {
    if (showLoading) {
      showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black54,
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          });
    }
  }

  static void hideLoading(BuildContext context,bool hideLoading) {
    if (hideLoading) {
      Navigator.of(context).pop();
    }
  }
}
