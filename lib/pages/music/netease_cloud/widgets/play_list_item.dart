import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

//歌单item

class PlayListItem extends StatelessWidget {
  String path;
  int count;
  String title;
  double width;
  double height;

  PlayListItem({Key key, @required this.path, @required this.count, this.title,this.width,this.height})
      : super(key: key);

  String playCountFormat(int playCount) {
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

  Widget _buildPlayCoount(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Image.asset(
            'assets/images/icon_triangle.png',
            width: 15,
            height: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 5, top: 5),
          child: Text(
            playCountFormat(count),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 15),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: path,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _buildPlayCoount(count),
                )
              ],
            ),
          ),
          title==null? Container()
              : Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
        ],
      ),
    );
  }
}
