import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlaylistCenterItemPage extends Page<PlaylistCenterItemState, Map<String, dynamic>> {
  PlaylistCenterItemPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlaylistCenterItemState>(
                adapter: null,
                slots: <String, Dependent<PlaylistCenterItemState>>{
                }),
            middleware: <Middleware<PlaylistCenterItemState>>[
            ],);

}
