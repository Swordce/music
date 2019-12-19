import 'package:fish_redux/fish_redux.dart';

class TestPageState implements Cloneable<TestPageState> {

  @override
  TestPageState clone() {
    return TestPageState();
  }
}

TestPageState initState(Map<String, dynamic> args) {
  return TestPageState();
}
