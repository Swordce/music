import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MusicPage extends Page<MusicState, Map<String, dynamic>> {
  MusicPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MusicState>(
                adapter: null,
                slots: <String, Dependent<MusicState>>{
                }),
            middleware: <Middleware<MusicState>>[
            ],);

}
