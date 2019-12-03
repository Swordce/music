import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/home/state.dart';

class HomeComponentState extends ComponentState<HomeState>
    with SingleTickerProviderStateMixin {}

class HomeComponent extends Component<HomeState> {
  @override
  ComponentState<HomeState> createState() {
    return HomeComponentState();
  }
}
