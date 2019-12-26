import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonPlaylistHeaderBottomView extends StatelessWidget implements PreferredSizeWidget {
  CommonPlaylistHeaderBottomView({this.count, this.dispatch});

  final Dispatch dispatch;
  final int count;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: SizedBox.fromSize(
              size: preferredSize,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    child: Image.asset(
                      'assets/images/icon_play.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: '播放全部');
                      },
                      child: Text(
                        "播放全部",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: count == null
                        ? Container()
                        : Text(
                            "(共$count首)",
                          ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
