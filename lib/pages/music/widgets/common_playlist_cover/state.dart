import 'package:fish_redux/fish_redux.dart';

class CommonMusicCoverState implements Cloneable<CommonMusicCoverState> {
  String coverImageUrl;
  String title;
  String description;
  List<String> tags;


  @override
  CommonMusicCoverState clone() {
    return CommonMusicCoverState()
    ..coverImageUrl = coverImageUrl
    ..tags = tags
    ..title = title
    ..description = description;
  }
}

CommonMusicCoverState initState(Map<String, dynamic> args) {
  CommonMusicCoverState newState = CommonMusicCoverState();
  newState.coverImageUrl = args['coverImageUrl'];
  newState.title = args['title'];
  newState.description = args['description'];
  newState.tags = args['tags'];
  return newState;
}
