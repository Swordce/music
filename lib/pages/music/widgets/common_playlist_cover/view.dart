import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommonMusicCoverState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: GestureDetector(
      onTap: (){
        Navigator.pop(viewService.context);
      },
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: state.coverImageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 80,
              sigmaX: 80,
            ),
            child: Container(
              color: Colors.black38,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            titleSpacing: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 115),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: state.coverImageUrl,
                        width: 210,
                        height: 210,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Text(
                      state.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '标签：',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Container(
                          height: 25,
                          alignment: Alignment.centerLeft,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 25,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: Colors.white12,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 38,
                                          child: Text(
                                            state.tags[index],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: state.tags.length,
                            shrinkWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 20,bottom: 20),
                    child: Text(
                      state.description,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 30),
            child: OutlineButton(
              onPressed: (){
                dispatch(CommonMusicCoverActionCreator.onSaveCover());
              },
              borderSide: BorderSide(
                  color: Colors.white
              ),
              shape: StadiumBorder(),
              child: Text('保存封面',style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    ),
  );
}
