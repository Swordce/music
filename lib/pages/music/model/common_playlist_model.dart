
class CommonPlaylistModel {
  var _id;
  var _copywriter;
  var _picUrl;
  var _playlistName;
  int _playCount;

  get id => _id;

  set id(value) {
    _id = value;
  }

  get copywriter => _copywriter;

  int get playCount => _playCount;

  set playCount(int value) {
    _playCount = value;
  }

  get playlistName => _playlistName;

  set playlistName(value) {
    _playlistName = value;
  }

  get picUrl => _picUrl;

  set picUrl(value) {
    _picUrl = value;
  }

  set copywriter(value) {
    _copywriter = value;
  }


}