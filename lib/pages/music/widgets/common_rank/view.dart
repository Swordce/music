import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/music/model/common_rank_model.dart';

import 'action.dart';
import 'state.dart';

Widget _buildOfficalItem(
    BuildContext context, CommonRankModel model, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushNamed('playlist_detail_page', arguments: {'id': model.id});
    },
    child: Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: index > 0 ? false : true,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(right: 20, bottom: 20),
              child: Text(
                '官方榜',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: model.coverImgUrl,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          model.updateFrequency,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, indexs) {
                        return Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '${indexs + 1}.${model.tracks[indexs].first}-${model.tracks[indexs].second}',
                            style: TextStyle(fontSize: 15),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                      itemCount: model.tracks.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildNormalItem(
    BuildContext context, CommonRankModel model, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushNamed('playlist_detail_page', arguments: {'id': model.id});
    },
    child: Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: model.coverImgUrl,
                  width: 100,
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    model.updateFrequency,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(model.name),
          ),
        ],
      ),
    ),
  );
}

Widget buildView(RankState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          '排行榜',
          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(viewService.context).pop();
          },
        ),
      ),
      body: state.rankModels == null
          ? Container(
              alignment: Alignment.center,
              child: Text('加载中...'),
            )
          : Stack(
              children: <Widget>[
                Padding(
                  padding: !state.showPlayView
                      ? EdgeInsets.only(bottom: 0)
                      : EdgeInsets.only(bottom: 60),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String type = state.rankModels[index].toplistType;
                              if (type == CommonRankModel.RANK_OFFICAL) {
                                return _buildOfficalItem(
                                    context, state.rankModels[index], index);
                              } else {
                                return Container();
                              }
                            },
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.rankModels.length,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(20),
                            child: Text(
                              '更多榜单',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                            child: GridView.builder(
                                itemCount: state.moreRankModels.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 0.8),
                                itemBuilder: (BuildContext context, int index) {
                                  return _buildNormalItem(context,
                                      state.moreRankModels[index], index);
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: state.showPlayView,
                    child: Container(
                      child: viewService.buildComponent('global_play_view'),
                    ))
              ],
            ),
    ),
  );
}
