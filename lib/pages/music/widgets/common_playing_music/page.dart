import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayingMusicPage extends Page<PlayingMusicState, Map<String, dynamic>> with TickerProviderMixin {
  PlayingMusicPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayingMusicState>(
                adapter: null,
                slots: <String, Dependent<PlayingMusicState>>{
                }),
            middleware: <Middleware<PlayingMusicState>>[
            ],);

}
