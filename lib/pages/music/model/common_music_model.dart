
class MusicModel {
  String playlistId;
  String coverImgUrl;
  String title;
  String avatarUrl;
  String nickname;
  String description;
  int playCount;
  int commentCount;
  int shareCount;
  int trackCount;

  List<MusicListModel> musicList;

  MusicModel(this.playlistId,this.coverImgUrl, this.title, this.avatarUrl, this.nickname,
      this.description, this.playCount, this.commentCount, this.shareCount,
      this.trackCount, this.musicList);

}
class MusicListModel {
  String musicImgUrl;
  String musicUrl;
  String musicName;
  String musicSoner;
  String musicLrc;
  String musicId;
  String musicAlbumName;

  MusicListModel(this.musicImgUrl, this.musicUrl, this.musicName,
      this.musicSoner, this.musicLrc, this.musicId, this.musicAlbumName);

}