import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/netease_cloud/model/recommend_playlist_entity.dart';
import 'package:music/widgets/empty_view.dart';
import 'package:sprintf/sprintf.dart';

class PlayListView extends StatelessWidget {
  List<RecommandPlaylistResult> playList;

  PlayListView({
    Key key,
    this.playList,
  }) : super(key: key);

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
      standardPlayCount = sprintf(
          "%d.%02d亿", [playCount ~/ 100000000, playCount % 100000000 ~/ 1000000]);
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
            style: TextStyle(color: Colors.white,fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _buildPlayListCell(String path, String title, int count) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
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
          Container(
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  '推荐歌单',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 80,
              margin: EdgeInsets.only(top: 20, right: 20),
              child: OutlineButton(
                borderSide: new BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '歌单广场',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: playList == null
              ? EmptyView()
              : GridView.custom(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.60),
                  childrenDelegate:
                      SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        switch (index) {
                          default:
                            Fluttertoast.showToast(msg: playList[index].name);
                            break;
                        }
                      },
                      child: _buildPlayListCell(playList[index].picUrl,
                          playList[index].name, playList[index].playCount),
                    );
                  }, childCount: playList.length),
                ),
        ),
      ],
    );
  }
}
