import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPagePage extends Page<MainPageState, Map<String, dynamic>> with TickerProviderMixin{
  MainPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MainPageState>(
                adapter: null,
                slots: <String, Dependent<MainPageState>>{
                }),
            middleware: <Middleware<MainPageState>>[
            ],);

}
