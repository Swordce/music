import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeSwiperPage extends Page<HomeSwiperState, Map<String, dynamic>> {
  HomeSwiperPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeSwiperState>(
                adapter: null,
                slots: <String, Dependent<HomeSwiperState>>{
                }),
            middleware: <Middleware<HomeSwiperState>>[
            ],);

}
