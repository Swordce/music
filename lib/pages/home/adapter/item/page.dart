import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePageItemPage extends Page<HomePageItemState, Map<String, dynamic>> {
  HomePageItemPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomePageItemState>(
                adapter: null,
                slots: <String, Dependent<HomePageItemState>>{
                }),
            middleware: <Middleware<HomePageItemState>>[
            ],);

}
