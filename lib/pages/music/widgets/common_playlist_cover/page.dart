import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommonMusicCoverPage extends Page<CommonMusicCoverState, Map<String, dynamic>> {
  CommonMusicCoverPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommonMusicCoverState>(
                adapter: null,
                slots: <String, Dependent<CommonMusicCoverState>>{
                }),
            middleware: <Middleware<CommonMusicCoverState>>[
            ],);

}
