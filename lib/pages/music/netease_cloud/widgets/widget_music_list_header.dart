import 'package:flutter/material.dart';

import 'h_empty_view.dart';

//歌单详情使用

class MusicListHeader extends StatelessWidget implements PreferredSizeWidget {
  MusicListHeader({this.count, this.tail,});

  final int count;
  final Widget tail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)),
      child: Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: SizedBox.fromSize(
              size: preferredSize,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 5),
                    child: Image.asset('assets/images/icon_play.png',width: 24,height: 24,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:6,top: 5.0),
                    child: Text(
                      "播放全部",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  HEmptyView(5),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: count == null
                        ? Container()
                        : Text(
                            "(共$count首)",
                          ),
                  ),
                  Spacer(),
                  tail ?? Container(),
                ],
              ),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
