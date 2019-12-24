import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayListDetailList extends StatelessWidget {
  final int index;
  final String musicName;
  final String musicSoner;

  const PlayListDetailList({Key key, this.index,this.musicName,this.musicSoner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25, right: 20),
            child: Text(
              index.toString(),
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    musicName,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      musicSoner,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert,color: Colors.black26,),
          )
        ],
      ),
    );
  }
}
