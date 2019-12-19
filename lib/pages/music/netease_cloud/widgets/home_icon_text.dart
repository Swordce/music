import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeIconText extends StatelessWidget {
  String iconPath;
  String title;
  var width = 40.0;
  HomeIconText({Key key, this.iconPath, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
      Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 2),
              border: Border.all(color: Colors.black12, width: 0.5),
              gradient: RadialGradient(
                colors: [
                  Color(0xFFFF8174),
                  Colors.red,
                ],
                center: Alignment(-1.7, 0),
                radius: 1,
              ),
              color: Colors.red),
        ),
        Image.asset(
          iconPath,
          width: width,
          height: width,
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: title == '每日推荐'
              ? Text(
                  '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              : Text(''),
        )
      ]),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: TextStyle(color: Colors.black87, fontSize: 13),
        ),
      ),
    ]);
  }
}
