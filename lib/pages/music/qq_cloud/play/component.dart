import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QQMusicComponent extends Component<QQMusicState> {
  QQMusicComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<QQMusicState>(
                adapter: null,
                slots: <String, Dependent<QQMusicState>>{
                }),);

}
