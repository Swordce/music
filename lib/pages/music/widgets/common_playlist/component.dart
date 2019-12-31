import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommonPlaylistComponent extends Component<CommonPlaylistState> {
  CommonPlaylistComponent()
      : super(
    effect: buildEffect(),
    reducer: buildReducer(),
    view: buildView,
    dependencies: Dependencies<CommonPlaylistState>(
        adapter: null,
        slots: <String, Dependent<CommonPlaylistState>>{
        }),);

}
