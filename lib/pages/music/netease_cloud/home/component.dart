import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NeteaseComponent extends Component<NeteaseState> {
  NeteaseComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NeteaseState>(
                adapter: null,
                slots: <String, Dependent<NeteaseState>>{
                }),);

}
