import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart'hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music/pages/music/model/common_playlist_model.dart';
import 'package:music/pages/music/netease_cloud/home/action.dart';
import 'package:music/pages/music/netease_cloud/model/recommend_playlist_entity.dart';
import 'package:music/widgets/empty_view.dart';

import 'widget_common_playlist_view.dart';

//推荐歌单

class RecommentPlaylistView extends StatelessWidget {
  List<CommonPlaylistModel> playlist;
  Dispatch dispatch;

  RecommentPlaylistView({
    Key key,
    this.playlist,
    this.dispatch
  }) : super(key: key);

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
                onPressed: (){
                  Navigator.of(context).pushNamed('playlist_center_page');
                },
                borderSide: new BorderSide(color: Colors.black54,width: 0.5),
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
          child: playlist == null
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
                        Navigator.of(context).pushNamed('playlist_detail_page',arguments: {'id':playlist[index].id.toString(),'copywriter':playlist[index].copywriter});
//                        dispatch(NeteaseActionCreator.onJumpToPlayList({'id':playlist[index].id.toString(),'copywriter':playlist[index].copywriter}));
                      },
                      child: CommonPlaylistView(width: 100,height: 100,path: playlist[index].picUrl,
                        title: playlist[index].playlistName, count:playlist[index].playCount,),
                    );
                  }, childCount: playlist.length),
                ),
        ),
      ],
    );
  }
}
