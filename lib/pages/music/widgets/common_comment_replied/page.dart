import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommentRepliedPage extends Page<CommentRepliedState, Map<String, dynamic>> {
  CommentRepliedPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommentRepliedState>(
                adapter: null,
                slots: <String, Dependent<CommentRepliedState>>{
                }),
            middleware: <Middleware<CommentRepliedState>>[
            ],);

}
