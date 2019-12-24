class PlayListDetailEntity {
	List<PlayListDetailPrivilege> privileges;
	dynamic urls;
	int code;
	PlayListDetailPlaylist playlist;
	dynamic relatedVideos;

	PlayListDetailEntity({this.privileges, this.urls, this.code, this.playlist, this.relatedVideos});

	PlayListDetailEntity.fromJson(Map<String, dynamic> json) {
		if (json['privileges'] != null) {
			privileges = new List<PlayListDetailPrivilege>();(json['privileges'] as List).forEach((v) { privileges.add(new PlayListDetailPrivilege.fromJson(v)); });
		}
		urls = json['urls'];
		code = json['code'];
		playlist = json['playlist'] != null ? new PlayListDetailPlaylist.fromJson(json['playlist']) : null;
		relatedVideos = json['relatedVideos'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.privileges != null) {
      data['privileges'] =  this.privileges.map((v) => v.toJson()).toList();
    }
		data['urls'] = this.urls;
		data['code'] = this.code;
		if (this.playlist != null) {
      data['playlist'] = this.playlist.toJson();
    }
		data['relatedVideos'] = this.relatedVideos;
		return data;
	}
}

class PlayListDetailPrivilege {
	int st;
	int flag;
	int subp;
	int fl;
	int fee;
	int dl;
	int cp;
	bool preSell;
	bool cs;
	bool toast;
	int maxbr;
	int id;
	int pl;
	int sp;
	int payed;

	PlayListDetailPrivilege({this.st, this.flag, this.subp, this.fl, this.fee, this.dl, this.cp, this.preSell, this.cs, this.toast, this.maxbr, this.id, this.pl, this.sp, this.payed});

	PlayListDetailPrivilege.fromJson(Map<String, dynamic> json) {
		st = json['st'];
		flag = json['flag'];
		subp = json['subp'];
		fl = json['fl'];
		fee = json['fee'];
		dl = json['dl'];
		cp = json['cp'];
		preSell = json['preSell'];
		cs = json['cs'];
		toast = json['toast'];
		maxbr = json['maxbr'];
		id = json['id'];
		pl = json['pl'];
		sp = json['sp'];
		payed = json['payed'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['st'] = this.st;
		data['flag'] = this.flag;
		data['subp'] = this.subp;
		data['fl'] = this.fl;
		data['fee'] = this.fee;
		data['dl'] = this.dl;
		data['cp'] = this.cp;
		data['preSell'] = this.preSell;
		data['cs'] = this.cs;
		data['toast'] = this.toast;
		data['maxbr'] = this.maxbr;
		data['id'] = this.id;
		data['pl'] = this.pl;
		data['sp'] = this.sp;
		data['payed'] = this.payed;
		return data;
	}
}

class PlayListDetailPlaylist {
	String description;
	int privacy;
	int trackNumberUpdateTime;
	bool subscribed;
	int shareCount;
	int adType;
	int trackCount;
	String coverimgidStr;
	int specialType;
	List<PlayListDetailPlaylistTrackid> trackIds;
	int id;
	dynamic englishTitle;
	bool ordered;
	PlayListDetailPlaylistCreator creator;
	List<PlayListDetailPlaylistSubscriber> subscribers;
	dynamic backgroundCoverUrl;
	bool opRecommend;
	bool highQuality;
	String commentThreadId;
	int updateTime;
	int trackUpdateTime;
	int userId;
	List<PlayListDetailPlaylistTrack> tracks;
	List<String> tags;
	int commentCount;
	int titleImage;
	int cloudTrackCount;
	String coverImgUrl;
	int playCount;
	int coverImgId;
	int createTime;
	String name;
	int backgroundCoverId;
	int subscribedCount;
	dynamic titleImageUrl;
	dynamic updateFrequency;
	int status;
	bool newImported;

	PlayListDetailPlaylist({this.description, this.privacy, this.trackNumberUpdateTime, this.subscribed, this.shareCount, this.adType, this.trackCount, this.coverimgidStr, this.specialType, this.trackIds, this.id, this.englishTitle, this.ordered, this.creator, this.subscribers, this.backgroundCoverUrl, this.opRecommend, this.highQuality, this.commentThreadId, this.updateTime, this.trackUpdateTime, this.userId, this.tracks, this.tags, this.commentCount, this.titleImage, this.cloudTrackCount, this.coverImgUrl, this.playCount, this.coverImgId, this.createTime, this.name, this.backgroundCoverId, this.subscribedCount, this.titleImageUrl, this.updateFrequency, this.status, this.newImported});

	PlayListDetailPlaylist.fromJson(Map<String, dynamic> json) {
		description = json['description'];
		privacy = json['privacy'];
		trackNumberUpdateTime = json['trackNumberUpdateTime'];
		subscribed = json['subscribed'];
		shareCount = json['shareCount'];
		adType = json['adType'];
		trackCount = json['trackCount'];
		coverimgidStr = json['coverImgId_str'];
		specialType = json['specialType'];
		if (json['trackIds'] != null) {
			trackIds = new List<PlayListDetailPlaylistTrackid>();(json['trackIds'] as List).forEach((v) { trackIds.add(new PlayListDetailPlaylistTrackid.fromJson(v)); });
		}
		id = json['id'];
		englishTitle = json['englishTitle'];
		ordered = json['ordered'];
		creator = json['creator'] != null ? new PlayListDetailPlaylistCreator.fromJson(json['creator']) : null;
		if (json['subscribers'] != null) {
			subscribers = new List<PlayListDetailPlaylistSubscriber>();(json['subscribers'] as List).forEach((v) { subscribers.add(new PlayListDetailPlaylistSubscriber.fromJson(v)); });
		}
		backgroundCoverUrl = json['backgroundCoverUrl'];
		opRecommend = json['opRecommend'];
		highQuality = json['highQuality'];
		commentThreadId = json['commentThreadId'];
		updateTime = json['updateTime'];
		trackUpdateTime = json['trackUpdateTime'];
		userId = json['userId'];
		if (json['tracks'] != null) {
			tracks = new List<PlayListDetailPlaylistTrack>();(json['tracks'] as List).forEach((v) { tracks.add(new PlayListDetailPlaylistTrack.fromJson(v)); });
		}
		tags = json['tags']?.cast<String>();
		commentCount = json['commentCount'];
		titleImage = json['titleImage'];
		cloudTrackCount = json['cloudTrackCount'];
		coverImgUrl = json['coverImgUrl'];
		playCount = json['playCount'];
		coverImgId = json['coverImgId'];
		createTime = json['createTime'];
		name = json['name'];
		backgroundCoverId = json['backgroundCoverId'];
		subscribedCount = json['subscribedCount'];
		titleImageUrl = json['titleImageUrl'];
		updateFrequency = json['updateFrequency'];
		status = json['status'];
		newImported = json['newImported'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['description'] = this.description;
		data['privacy'] = this.privacy;
		data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
		data['subscribed'] = this.subscribed;
		data['shareCount'] = this.shareCount;
		data['adType'] = this.adType;
		data['trackCount'] = this.trackCount;
		data['coverImgId_str'] = this.coverimgidStr;
		data['specialType'] = this.specialType;
		if (this.trackIds != null) {
      data['trackIds'] =  this.trackIds.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		data['englishTitle'] = this.englishTitle;
		data['ordered'] = this.ordered;
		if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
		if (this.subscribers != null) {
      data['subscribers'] =  this.subscribers.map((v) => v.toJson()).toList();
    }
		data['backgroundCoverUrl'] = this.backgroundCoverUrl;
		data['opRecommend'] = this.opRecommend;
		data['highQuality'] = this.highQuality;
		data['commentThreadId'] = this.commentThreadId;
		data['updateTime'] = this.updateTime;
		data['trackUpdateTime'] = this.trackUpdateTime;
		data['userId'] = this.userId;
		if (this.tracks != null) {
      data['tracks'] =  this.tracks.map((v) => v.toJson()).toList();
    }
		data['tags'] = this.tags;
		data['commentCount'] = this.commentCount;
		data['titleImage'] = this.titleImage;
		data['cloudTrackCount'] = this.cloudTrackCount;
		data['coverImgUrl'] = this.coverImgUrl;
		data['playCount'] = this.playCount;
		data['coverImgId'] = this.coverImgId;
		data['createTime'] = this.createTime;
		data['name'] = this.name;
		data['backgroundCoverId'] = this.backgroundCoverId;
		data['subscribedCount'] = this.subscribedCount;
		data['titleImageUrl'] = this.titleImageUrl;
		data['updateFrequency'] = this.updateFrequency;
		data['status'] = this.status;
		data['newImported'] = this.newImported;
		return data;
	}
}

class PlayListDetailPlaylistTrackid {
	int v;
	int id;
	dynamic alg;

	PlayListDetailPlaylistTrackid({this.v, this.id, this.alg});

	PlayListDetailPlaylistTrackid.fromJson(Map<String, dynamic> json) {
		v = json['v'];
		id = json['id'];
		alg = json['alg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['v'] = this.v;
		data['id'] = this.id;
		data['alg'] = this.alg;
		return data;
	}
}

class PlayListDetailPlaylistCreator {
	int birthday;
	String detailDescription;
	String backgroundUrl;
	int gender;
	int city;
	String signature;
	String description;
	dynamic remarkName;
	int accountStatus;
	int avatarImgId;
	bool defaultAvatar;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	int province;
	String nickname;
	dynamic expertTags;
	int djStatus;
	String avatarUrl;
	int authStatus;
	int vipType;
	bool followed;
	int userId;
	bool mutual;
	String avatarimgidStr;
	int authority;
	int userType;
	int backgroundImgId;
	dynamic experts;

	PlayListDetailPlaylistCreator({this.birthday, this.detailDescription, this.backgroundUrl, this.gender, this.city, this.signature, this.description, this.remarkName, this.accountStatus, this.avatarImgId, this.defaultAvatar, this.avatarImgIdStr, this.backgroundImgIdStr, this.province, this.nickname, this.expertTags, this.djStatus, this.avatarUrl, this.authStatus, this.vipType, this.followed, this.userId, this.mutual, this.avatarimgidStr, this.authority, this.userType, this.backgroundImgId, this.experts});

	PlayListDetailPlaylistCreator.fromJson(Map<String, dynamic> json) {
		birthday = json['birthday'];
		detailDescription = json['detailDescription'];
		backgroundUrl = json['backgroundUrl'];
		gender = json['gender'];
		city = json['city'];
		signature = json['signature'];
		description = json['description'];
		remarkName = json['remarkName'];
		accountStatus = json['accountStatus'];
		avatarImgId = json['avatarImgId'];
		defaultAvatar = json['defaultAvatar'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		province = json['province'];
		nickname = json['nickname'];
		expertTags = json['expertTags'];
		djStatus = json['djStatus'];
		avatarUrl = json['avatarUrl'];
		authStatus = json['authStatus'];
		vipType = json['vipType'];
		followed = json['followed'];
		userId = json['userId'];
		mutual = json['mutual'];
		avatarimgidStr = json['avatarImgId_str'];
		authority = json['authority'];
		userType = json['userType'];
		backgroundImgId = json['backgroundImgId'];
		experts = json['experts'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['birthday'] = this.birthday;
		data['detailDescription'] = this.detailDescription;
		data['backgroundUrl'] = this.backgroundUrl;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['remarkName'] = this.remarkName;
		data['accountStatus'] = this.accountStatus;
		data['avatarImgId'] = this.avatarImgId;
		data['defaultAvatar'] = this.defaultAvatar;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['province'] = this.province;
		data['nickname'] = this.nickname;
		data['expertTags'] = this.expertTags;
		data['djStatus'] = this.djStatus;
		data['avatarUrl'] = this.avatarUrl;
		data['authStatus'] = this.authStatus;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['avatarImgId_str'] = this.avatarimgidStr;
		data['authority'] = this.authority;
		data['userType'] = this.userType;
		data['backgroundImgId'] = this.backgroundImgId;
		data['experts'] = this.experts;
		return data;
	}
}

class PlayListDetailPlaylistSubscriber {
	int birthday;
	String detailDescription;
	String backgroundUrl;
	int gender;
	int city;
	String signature;
	String description;
	dynamic remarkName;
	int accountStatus;
	int avatarImgId;
	bool defaultAvatar;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	int province;
	String nickname;
	dynamic expertTags;
	int djStatus;
	String avatarUrl;
	int authStatus;
	int vipType;
	bool followed;
	int userId;
	bool mutual;
	String avatarimgidStr;
	int authority;
	int userType;
	int backgroundImgId;
	dynamic experts;

	PlayListDetailPlaylistSubscriber({this.birthday, this.detailDescription, this.backgroundUrl, this.gender, this.city, this.signature, this.description, this.remarkName, this.accountStatus, this.avatarImgId, this.defaultAvatar, this.avatarImgIdStr, this.backgroundImgIdStr, this.province, this.nickname, this.expertTags, this.djStatus, this.avatarUrl, this.authStatus, this.vipType, this.followed, this.userId, this.mutual, this.avatarimgidStr, this.authority, this.userType, this.backgroundImgId, this.experts});

	PlayListDetailPlaylistSubscriber.fromJson(Map<String, dynamic> json) {
		birthday = json['birthday'];
		detailDescription = json['detailDescription'];
		backgroundUrl = json['backgroundUrl'];
		gender = json['gender'];
		city = json['city'];
		signature = json['signature'];
		description = json['description'];
		remarkName = json['remarkName'];
		accountStatus = json['accountStatus'];
		avatarImgId = json['avatarImgId'];
		defaultAvatar = json['defaultAvatar'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		province = json['province'];
		nickname = json['nickname'];
		expertTags = json['expertTags'];
		djStatus = json['djStatus'];
		avatarUrl = json['avatarUrl'];
		authStatus = json['authStatus'];
		vipType = json['vipType'];
		followed = json['followed'];
		userId = json['userId'];
		mutual = json['mutual'];
		avatarimgidStr = json['avatarImgId_str'];
		authority = json['authority'];
		userType = json['userType'];
		backgroundImgId = json['backgroundImgId'];
		experts = json['experts'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['birthday'] = this.birthday;
		data['detailDescription'] = this.detailDescription;
		data['backgroundUrl'] = this.backgroundUrl;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['remarkName'] = this.remarkName;
		data['accountStatus'] = this.accountStatus;
		data['avatarImgId'] = this.avatarImgId;
		data['defaultAvatar'] = this.defaultAvatar;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['province'] = this.province;
		data['nickname'] = this.nickname;
		data['expertTags'] = this.expertTags;
		data['djStatus'] = this.djStatus;
		data['avatarUrl'] = this.avatarUrl;
		data['authStatus'] = this.authStatus;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['avatarImgId_str'] = this.avatarimgidStr;
		data['authority'] = this.authority;
		data['userType'] = this.userType;
		data['backgroundImgId'] = this.backgroundImgId;
		data['experts'] = this.experts;
		return data;
	}
}

class PlayListDetailPlaylistTrack {
	int no;
	String rt;
	int copyright;
	int fee;
	dynamic rurl;
	int mst;
	int pst;
	int pop;
	int dt;
	int rtype;
	int sId;
	List<Null> rtUrls;
	int id;
	int st;
	dynamic a;
	String cd;
	int publishTime;
	String cf;
	PlayListDetailPlaylistTracksH h;
	int mv;
	PlayListDetailPlaylistTracksAl al;
	PlayListDetailPlaylistTracksL l;
	PlayListDetailPlaylistTracksM m;
	int cp;
	List<Null> alia;
	int djId;
	dynamic crbt;
	List<PlayListDetailPlaylistTracksAr> ar;
	dynamic rtUrl;
	int ftype;
	int t;
	int v;
	String name;
	int mark;

	PlayListDetailPlaylistTrack({this.no, this.rt, this.copyright, this.fee, this.rurl, this.mst, this.pst, this.pop, this.dt, this.rtype, this.sId, this.rtUrls, this.id, this.st, this.a, this.cd, this.publishTime, this.cf, this.h, this.mv, this.al, this.l, this.m, this.cp, this.alia, this.djId, this.crbt, this.ar, this.rtUrl, this.ftype, this.t, this.v, this.name, this.mark});

	PlayListDetailPlaylistTrack.fromJson(Map<String, dynamic> json) {
		no = json['no'];
		rt = json['rt'];
		copyright = json['copyright'];
		fee = json['fee'];
		rurl = json['rurl'];
		mst = json['mst'];
		pst = json['pst'];
		pop = json['pop'];
		dt = json['dt'];
		rtype = json['rtype'];
		sId = json['s_id'];
		if (json['rtUrls'] != null) {
			rtUrls = new List<Null>();
		}
		id = json['id'];
		st = json['st'];
		a = json['a'];
		cd = json['cd'];
		publishTime = json['publishTime'];
		cf = json['cf'];
		h = json['h'] != null ? new PlayListDetailPlaylistTracksH.fromJson(json['h']) : null;
		mv = json['mv'];
		al = json['al'] != null ? new PlayListDetailPlaylistTracksAl.fromJson(json['al']) : null;
		l = json['l'] != null ? new PlayListDetailPlaylistTracksL.fromJson(json['l']) : null;
		m = json['m'] != null ? new PlayListDetailPlaylistTracksM.fromJson(json['m']) : null;
		cp = json['cp'];
		if (json['alia'] != null) {
			alia = new List<Null>();
		}
		djId = json['djId'];
		crbt = json['crbt'];
		if (json['ar'] != null) {
			ar = new List<PlayListDetailPlaylistTracksAr>();(json['ar'] as List).forEach((v) { ar.add(new PlayListDetailPlaylistTracksAr.fromJson(v)); });
		}
		rtUrl = json['rtUrl'];
		ftype = json['ftype'];
		t = json['t'];
		v = json['v'];
		name = json['name'];
		mark = json['mark'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['no'] = this.no;
		data['rt'] = this.rt;
		data['copyright'] = this.copyright;
		data['fee'] = this.fee;
		data['rurl'] = this.rurl;
		data['mst'] = this.mst;
		data['pst'] = this.pst;
		data['pop'] = this.pop;
		data['dt'] = this.dt;
		data['rtype'] = this.rtype;
		data['s_id'] = this.sId;
		if (this.rtUrls != null) {
      data['rtUrls'] =  [];
    }
		data['id'] = this.id;
		data['st'] = this.st;
		data['a'] = this.a;
		data['cd'] = this.cd;
		data['publishTime'] = this.publishTime;
		data['cf'] = this.cf;
		if (this.h != null) {
      data['h'] = this.h.toJson();
    }
		data['mv'] = this.mv;
		if (this.al != null) {
      data['al'] = this.al.toJson();
    }
		if (this.l != null) {
      data['l'] = this.l.toJson();
    }
		if (this.m != null) {
      data['m'] = this.m.toJson();
    }
		data['cp'] = this.cp;
		if (this.alia != null) {
      data['alia'] =  [];
    }
		data['djId'] = this.djId;
		data['crbt'] = this.crbt;
		if (this.ar != null) {
      data['ar'] =  this.ar.map((v) => v.toJson()).toList();
    }
		data['rtUrl'] = this.rtUrl;
		data['ftype'] = this.ftype;
		data['t'] = this.t;
		data['v'] = this.v;
		data['name'] = this.name;
		data['mark'] = this.mark;
		return data;
	}
}

class PlayListDetailPlaylistTracksH {
	int br;
	int fid;
	int size;
	var vd;

	PlayListDetailPlaylistTracksH({this.br, this.fid, this.size, this.vd});

	PlayListDetailPlaylistTracksH.fromJson(Map<String, dynamic> json) {
		br = json['br'];
		fid = json['fid'];
		size = json['size'];
		vd = json['vd'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['br'] = this.br;
		data['fid'] = this.fid;
		data['size'] = this.size;
		data['vd'] = this.vd;
		return data;
	}
}

class PlayListDetailPlaylistTracksAl {
	String picUrl;
	String name;
	List<Null> tns;
	String picStr;
	int id;
	int pic;

	PlayListDetailPlaylistTracksAl({this.picUrl, this.name, this.tns, this.picStr, this.id, this.pic});

	PlayListDetailPlaylistTracksAl.fromJson(Map<String, dynamic> json) {
		picUrl = json['picUrl'];
		name = json['name'];
		if (json['tns'] != null) {
			tns = new List<Null>();
		}
		picStr = json['pic_str'];
		id = json['id'];
		pic = json['pic'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picUrl'] = this.picUrl;
		data['name'] = this.name;
		if (this.tns != null) {
      data['tns'] =  [];
    }
		data['pic_str'] = this.picStr;
		data['id'] = this.id;
		data['pic'] = this.pic;
		return data;
	}
}

class PlayListDetailPlaylistTracksL {
	int br;
	int fid;
	int size;
	var vd;

	PlayListDetailPlaylistTracksL({this.br, this.fid, this.size, this.vd});

	PlayListDetailPlaylistTracksL.fromJson(Map<String, dynamic> json) {
		br = json['br'];
		fid = json['fid'];
		size = json['size'];
		vd = json['vd'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['br'] = this.br;
		data['fid'] = this.fid;
		data['size'] = this.size;
		data['vd'] = this.vd;
		return data;
	}
}

class PlayListDetailPlaylistTracksM {
	int br;
	int fid;
	int size;
	var vd;

	PlayListDetailPlaylistTracksM({this.br, this.fid, this.size, this.vd});

	PlayListDetailPlaylistTracksM.fromJson(Map<String, dynamic> json) {
		br = json['br'];
		fid = json['fid'];
		size = json['size'];
		vd = json['vd'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['br'] = this.br;
		data['fid'] = this.fid;
		data['size'] = this.size;
		data['vd'] = this.vd;
		return data;
	}
}

class PlayListDetailPlaylistTracksAr {
	String name;
	List<Null> tns;
	List<Null> alias;
	int id;

	PlayListDetailPlaylistTracksAr({this.name, this.tns, this.alias, this.id});

	PlayListDetailPlaylistTracksAr.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		if (json['tns'] != null) {
			tns = new List<Null>();
		}
		if (json['alias'] != null) {
			alias = new List<Null>();
		}
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		if (this.tns != null) {
      data['tns'] =  [];
    }
		if (this.alias != null) {
      data['alias'] =  [];
    }
		data['id'] = this.id;
		return data;
	}
}
