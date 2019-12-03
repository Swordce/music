import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WelfarePage extends Page<WelfareState, Map<String, dynamic>> {
  WelfarePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WelfareState>(
                adapter: null,
                slots: <String, Dependent<WelfareState>>{
                }),
            middleware: <Middleware<WelfareState>>[
            ],);

}
