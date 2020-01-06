
class CommonRankModel {
  static const String RANK_OFFICAL = '官方榜';
  static const String RANK_RECOMMEND = '官方榜';
  static const String RANK_WORLD = '全球榜';
  static const String RANK_MORE = '更多榜单';

  String _id;
  String _name;
  String _description;
  String _coverImgUrl;
  String _updateFrequency;
  String _toplistType;
  List<CommonRankTracksModel> _tracks;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  List<CommonRankTracksModel> get tracks => _tracks;

  set tracks(List<CommonRankTracksModel> value) {
    _tracks = value;
  }

  String get toplistType => _toplistType;

  set toplistType(String value) {
    _toplistType = value;
  }

  String get updateFrequency => _updateFrequency;

  set updateFrequency(String value) {
    _updateFrequency = value;
  }

  String get coverImgUrl => _coverImgUrl;

  set coverImgUrl(String value) {
    _coverImgUrl = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set name(String value) {
    _name = value;
  }


}

class CommonRankTracksModel {
  String _first;
  String _second;
  String _third;

  String get first => _first;

  set first(String value) {
    _first = value;
  }

  String get second => _second;

  set second(String value) {
    _second = value;
  }

  String get third => _third;

  set third(String value) {
    _third = value;
  }


}