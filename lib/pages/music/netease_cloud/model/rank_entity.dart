import 'dart:core';

class RankEntity {
  int code;
  List<RankList> list;
  ArtistToplist artistToplist;
  RewardToplist rewardToplist;

  RankEntity({this.code, this.list, this.artistToplist, this.rewardToplist});

  RankEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<RankList>();
      json['list'].forEach((v) {
        list.add(new RankList.fromJson(v));
      });
    }
    artistToplist = json['artistToplist'] != null
        ? new ArtistToplist.fromJson(json['artistToplist'])
        : null;
    rewardToplist = json['rewardToplist'] != null
        ? new RewardToplist.fromJson(json['rewardToplist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.artistToplist != null) {
      data['artistToplist'] = this.artistToplist.toJson();
    }
    if (this.rewardToplist != null) {
      data['rewardToplist'] = this.rewardToplist.toJson();
    }
    return data;
  }
}

class RankList {
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  Null backgroundCoverUrl;
  int titleImage;
  Null titleImageUrl;
  Null englishTitle;
  bool opRecommend;
  Null recommendInfo;
  int coverImgId;
  int status;
  bool newImported;
  bool anonimous;
  String coverImgUrl;
  int updateTime;
  int specialType;
  bool ordered;
  int privacy;
  int trackUpdateTime;
  int trackCount;
  int totalDuration;
  String commentThreadId;
  int trackNumberUpdateTime;
  int playCount;
  int subscribedCount;
  int cloudTrackCount;
  List<String> tags;
  int createTime;
  bool highQuality;
  int userId;
  String description;
  int adType;
  String name;
  int id;
  String coverImgIdStr;
  String toplistType;

  RankList(
      {
        this.tracks,
        this.updateFrequency,
        this.backgroundCoverId,
        this.backgroundCoverUrl,
        this.titleImage,
        this.titleImageUrl,
        this.englishTitle,
        this.opRecommend,
        this.recommendInfo,
        this.coverImgId,
        this.status,
        this.newImported,
        this.anonimous,
        this.coverImgUrl,
        this.updateTime,
        this.specialType,
        this.ordered,
        this.privacy,
        this.trackUpdateTime,
        this.trackCount,
        this.totalDuration,
        this.commentThreadId,
        this.trackNumberUpdateTime,
        this.playCount,
        this.subscribedCount,
        this.cloudTrackCount,
        this.tags,
        this.createTime,
        this.highQuality,
        this.userId,
        this.description,
        this.adType,
        this.name,
        this.id,
        this.coverImgIdStr,
        this.toplistType});

  RankList.fromJson(Map<String, dynamic> json) {
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    titleImage = json['titleImage'];
    titleImageUrl = json['titleImageUrl'];
    englishTitle = json['englishTitle'];
    opRecommend = json['opRecommend'];
    recommendInfo = json['recommendInfo'];
    coverImgId = json['coverImgId'];
    status = json['status'];
    newImported = json['newImported'];
    anonimous = json['anonimous'];
    coverImgUrl = json['coverImgUrl'];
    updateTime = json['updateTime'];
    specialType = json['specialType'];
    ordered = json['ordered'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    totalDuration = json['totalDuration'];
    commentThreadId = json['commentThreadId'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    playCount = json['playCount'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    tags = json['tags'].cast<String>();
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    userId = json['userId'];
    description = json['description'];
    adType = json['adType'];
    name = json['name'];
    id = json['id'];
    coverImgIdStr = json['coverImgId_str'];
    toplistType = json['ToplistType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['titleImage'] = this.titleImage;
    data['titleImageUrl'] = this.titleImageUrl;
    data['englishTitle'] = this.englishTitle;
    data['opRecommend'] = this.opRecommend;
    data['recommendInfo'] = this.recommendInfo;
    data['coverImgId'] = this.coverImgId;
    data['status'] = this.status;
    data['newImported'] = this.newImported;
    data['anonimous'] = this.anonimous;
    data['coverImgUrl'] = this.coverImgUrl;
    data['updateTime'] = this.updateTime;
    data['specialType'] = this.specialType;
    data['ordered'] = this.ordered;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['totalDuration'] = this.totalDuration;
    data['commentThreadId'] = this.commentThreadId;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['playCount'] = this.playCount;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['tags'] = this.tags;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['userId'] = this.userId;
    data['description'] = this.description;
    data['adType'] = this.adType;
    data['name'] = this.name;
    data['id'] = this.id;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['ToplistType'] = this.toplistType;
    return data;
  }
}

class Tracks {
  String first;
  String second;

  Tracks({this.first, this.second});

  Tracks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}

class ArtistToplist {
  String coverUrl;
  List<Artists> artists;
  String name;
  String upateFrequency;
  int position;
  String updateFrequency;

  ArtistToplist(
      {this.coverUrl,
        this.artists,
        this.name,
        this.upateFrequency,
        this.position,
        this.updateFrequency});

  ArtistToplist.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    name = json['name'];
    upateFrequency = json['upateFrequency'];
    position = json['position'];
    updateFrequency = json['updateFrequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['upateFrequency'] = this.upateFrequency;
    data['position'] = this.position;
    data['updateFrequency'] = this.updateFrequency;
    return data;
  }
}

class Artists {
  String first;
  String second;
  int third;

  Artists({this.first, this.second, this.third});

  Artists.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
    third = json['third'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    data['third'] = this.third;
    return data;
  }
}

class RewardToplist {
  String coverUrl;
  List<Songs> songs;
  String name;
  int position;

  RewardToplist({this.coverUrl, this.songs, this.name, this.position});

  RewardToplist.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Songs {
  String name;
  int id;
  int position;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<RewardArtists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String copyFrom;
  String commentThreadId;
  int ftype;
  int copyright;
  int mark;
  BMusic bMusic;
  int mvid;
  int rtype;
  BMusic hMusic;
  BMusic mMusic;
  BMusic lMusic;

  Songs(
      {this.name,
        this.id,
        this.position,
        this.status,
        this.fee,
        this.copyrightId,
        this.disc,
        this.no,
        this.artists,
        this.album,
        this.starred,
        this.popularity,
        this.score,
        this.starredNum,
        this.duration,
        this.playedNum,
        this.dayPlays,
        this.hearTime,
        this.copyFrom,
        this.commentThreadId,
        this.ftype,
        this.copyright,
        this.mark,
        this.bMusic,
        this.mvid,
        this.rtype,
        this.hMusic,
        this.mMusic,
        this.lMusic});

  Songs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<RewardArtists>();
      json['artists'].forEach((v) {
        artists.add(new RewardArtists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    ftype = json['ftype'];

    copyright = json['copyright'];
    mark = json['mark'];
    bMusic =
    json['bMusic'] != null ? new BMusic.fromJson(json['bMusic']) : null;
    mvid = json['mvid'];
    rtype = json['rtype'];
    hMusic =
    json['hMusic'] != null ? new BMusic.fromJson(json['hMusic']) : null;
    mMusic =
    json['mMusic'] != null ? new BMusic.fromJson(json['mMusic']) : null;
    lMusic =
    json['lMusic'] != null ? new BMusic.fromJson(json['lMusic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['ftype'] = this.ftype;
    data['copyright'] = this.copyright;
    data['mark'] = this.mark;
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    data['mvid'] = this.mvid;
    data['rtype'] = this.rtype;
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    return data;
  }
}

class RewardArtists {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  String trans;
  int musicSize;
  int topicPerson;

  RewardArtists(
      {this.name,
        this.id,
        this.picId,
        this.img1v1Id,
        this.briefDesc,
        this.picUrl,
        this.img1v1Url,
        this.albumSize,
        this.trans,
        this.musicSize,
        this.topicPerson});

  RewardArtists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    data['topicPerson'] = this.topicPerson;
    return data;
  }
}

class Album {
  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artists artist;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  Null transName;
  int mark;
  String picIdStr;

  Album(
      {this.name,
        this.id,
        this.type,
        this.size,
        this.picId,
        this.blurPicUrl,
        this.companyId,
        this.pic,
        this.picUrl,
        this.publishTime,
        this.description,
        this.tags,
        this.company,
        this.briefDesc,
        this.artist,
        this.status,
        this.copyrightId,
        this.commentThreadId,
        this.artists,
        this.subType,
        this.transName,
        this.mark,
        this.picIdStr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist =
    json['artist'] != null ? new Artists.fromJson(json['artist']) : null;
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    subType = json['subType'];
    transName = json['transName'];
    mark = json['mark'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['transName'] = this.transName;
    data['mark'] = this.mark;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class BMusic {
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

  BMusic(
      {
        this.id,
        this.size,
        this.extension,
        this.sr,
        this.dfsId,
        this.bitrate,
        this.playTime,
        this.volumeDelta});

  BMusic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}
