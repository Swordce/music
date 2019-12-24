import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart'hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:music/pages/music/netease_cloud/home/action.dart';
import 'package:music/pages/music/netease_cloud/model/recommend_playlist_entity.dart';
import 'package:music/widgets/empty_view.dart';

import 'play_list_item.dart';

//推荐歌单

class PlayListView extends StatelessWidget {
  List<RecommandPlaylistResult> playList;
  Dispatch dispatch;

  PlayListView({
    Key key,
    this.playList,
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
                        dispatch(NeteaseActionCreator.onJumpToPlayList({'id':playList[index].id.toString(),'copywriter':playList[index].copywriter}));
                      },
                      child: PlayListItem(width: 100,height: 100,path: playList[index].picUrl,
                        title: playList[index].name, count:playList[index].playCount,),
                    );
                  }, childCount: playList.length),
                ),
        ),
      ],
    );
  }
}
