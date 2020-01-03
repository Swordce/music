
class PlaylistCenterCategoryEntity {
  int code;
  List<PlaylistCenterTags> tags;

  PlaylistCenterCategoryEntity({this.code, this.tags});

  PlaylistCenterCategoryEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['tags'] != null) {
      tags = new List<PlaylistCenterTags>();(json['tags'] as List).forEach((v) { tags.add(new PlaylistCenterTags.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.tags != null) {
      data['banners'] =  this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class PlaylistCenterTags {
  bool activity;
  bool hot;
  int usedCount;
  int createTime;
  int category;
  int position;
  String name;
  int id;
  int type;
  PlaylistTag playlistTag;

  PlaylistCenterTags.fromJson(Map<String,dynamic> json) {
    activity = json['activity'];
    hot = json['hot'];
    usedCount = json['usedCount'];
    createTime = json['createTime'];
    category = json['category'];
    position = json['position'];
    name = json['name'];
    id = json['id'];
    type = json['type'];
    playlistTag = json['playlistTag'] != null? PlaylistTag.fromJson(json['playlistTag']) : null;
  }

  Map<String,dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['hot'] = this.hot;
    data['usedCount'] = this.usedCount;
    data['createTime'] = this.createTime;
    data['category'] = this.category;
    data['position'] = this.position;
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    if(this.playlistTag != null) {
      data['playlistTag'] = this.playlistTag;
    }
    return data;
  }

}

class PlaylistTag {
  int id;
  String name;
  int category;
  int usedCount;
  int type;
  int position;
  int createTime;
  int highQuality;
  int highQualityPos;
  int officialPos;

  PlaylistTag({this.id, this.name, this.category, this.usedCount, this.type,
    this.position, this.createTime, this.highQuality, this.highQualityPos,
    this.officialPos});

  PlaylistTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    usedCount = json['usedCount'];
    type = json['type'];
    position = json['position'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    highQualityPos = json['highQualityPos'];
    officialPos = json['officialPos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['usedCount'] = this.usedCount;
    data['type'] = this.type;
    data['position'] = this.position;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['highQualityPos'] = this.highQualityPos;
    data['officialPos'] = this.officialPos;
    return data;
  }

}