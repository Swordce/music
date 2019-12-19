import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/widgets/keepalive_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(XiamiMusicState state, Dispatch dispatch, ViewService viewService) {
  return keepAliveWrapper(Container(
    child: Text('虾米'),
  ));
}
