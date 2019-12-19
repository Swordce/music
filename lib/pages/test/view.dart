import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TestPageState state, Dispatch dispatch, ViewService viewService) {
  return Builder(builder: (context) {
    return Container(
      child: Text("111111"),
    );
  });
}
