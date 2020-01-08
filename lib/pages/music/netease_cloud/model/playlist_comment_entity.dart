class PlaylistCommentEntity {
  bool isMusician;
  int userId;
  bool moreHot;
  int code;
  int total;
  bool more;
  List<Comments> topComments;
  List<Comments> hotComments;
  List<Comments> comments;

  PlaylistCommentEntity({this.isMusician, this.userId, this.moreHot, this.code,
    this.total, this.more, this.topComments, this.hotComments, this.comments});

  PlaylistCommentEntity.fromJson(Map<String, dynamic> json) {
    isMusician = json['isMusician'];
    userId = json['userId'];
    moreHot = json['moreHot'];
    code = json['code'];
    total = json['total'];
    more = json['more'];

    if (json['topComments'] != null) {
      topComments = new List<Comments>();
      json['topComments'].forEach((v) {
        topComments.add(new Comments.fromJson(v));
      });
    }

    if (json['hotComments'] != null) {
      hotComments = new List<Comments>();
      json['hotComments'].forEach((v) {
        hotComments.add(new Comments.fromJson(v));
      });
    }

    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
  }

}

class Comments {
  int commentId;
  String content;
  int time;
  int likedCount;
  int commentLocationType;
  int parentCommentId;
  bool liked;
  User user;
  List<BeReplied> beReplied;

  Comments({this.commentId, this.content, this.time, this.likedCount,
    this.commentLocationType, this.parentCommentId, this.liked, this.user,
    this.beReplied});

  Comments.fromJson(Map<String,dynamic> json) {
    commentId = json['commentId'];
    content = json['content'];
    time = json['time'];
    likedCount = json['likedCount'];
    commentLocationType = json['commentLocationType'];
    parentCommentId = json['parentCommentId'];
    liked = json['liked'];
    if(json['user'] != null) {
      user = User.fromJson(json['user']);
    }

    if(json['beReplied'] != null) {
      beReplied = new List<BeReplied>();
      json['beReplied'].forEach((v) {
        beReplied.add(new BeReplied.fromJson(v));
      });
    }

  }

}

class User {
  String avatarUrl;
  int userId;
  String nickname;
  int vipType;

  User({this.avatarUrl, this.userId, this.nickname, this.vipType});

  User.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    userId = json['userId'];
    nickname = json['nickname'];
    vipType = json['vipType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['vipType'] = this.vipType;
    return data;
  }

}

class BeReplied {
  User user;
  int beRepliedCommentId;
  String content;

  BeReplied({this.user, this.beRepliedCommentId, this.content});

  BeReplied.fromJson(Map<String,dynamic> json) {
    if(json['user'] != null) {
      user = User.fromJson(json['user']);
    }
    beRepliedCommentId = json['beRepliedCommentId'];
    content = json['content'];
  }

  Map<String,dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['beRepliedCommentId'] = this.beRepliedCommentId;
    data['content'] = this.content;
    return data;
  }

}