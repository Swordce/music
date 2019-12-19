
import 'package:flutter/cupertino.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50),
      child: Text('暂无推荐歌单'),
    );
  }

}