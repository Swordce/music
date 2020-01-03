class PlaylistCenterEntity {
	List<Playlists> playlists;
	int code;
	bool more;
	int lasttime;
	int total;

	PlaylistCenterEntity(
			{this.playlists, this.code, this.more, this.lasttime, this.total});

	PlaylistCenterEntity.fromJson(Map<String, dynamic> json) {
		if (json['playlists'] != null) {
			playlists = new List<Playlists>();
			json['playlists'].forEach((v) {
				playlists.add(new Playlists.fromJson(v));
			});
		}
		code = json['code'];
		more = json['more'];
		lasttime = json['lasttime'];
		total = json['total'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.playlists != null) {
			data['playlists'] = this.playlists.map((v) => v.toJson()).toList();
		}
		data['code'] = this.code;
		data['more'] = this.more;
		data['lasttime'] = this.lasttime;
		data['total'] = this.total;
		return data;
	}
}

class Playlists {
	String name;
	int id;
	int trackNumberUpdateTime;
	int status;
	int userId;
	int createTime;
	int updateTime;
	int subscribedCount;
	int trackCount;
	int cloudTrackCount;
	String coverImgUrl;
	int coverImgId;
	String description;
	List<String> tags;
	int playCount;
	int trackUpdateTime;
	int specialType;
	int totalDuration;
	Creator creator;
	Null tracks;
	List<Subscribers> subscribers;
	Null subscribed;
	String commentThreadId;
	bool newImported;
	int adType;
	bool highQuality;
	int privacy;
	bool ordered;
	bool anonimous;
	int coverStatus;
	Null recommendInfo;
	int shareCount;
	String coverImgIdStr;
	int commentCount;
	String copywriter;
	String tag;

	Playlists(
			{this.name,
				this.id,
				this.trackNumberUpdateTime,
				this.status,
				this.userId,
				this.createTime,
				this.updateTime,
				this.subscribedCount,
				this.trackCount,
				this.cloudTrackCount,
				this.coverImgUrl,
				this.coverImgId,
				this.description,
				this.tags,
				this.playCount,
				this.trackUpdateTime,
				this.specialType,
				this.totalDuration,
				this.creator,
				this.tracks,
				this.subscribers,
				this.subscribed,
				this.commentThreadId,
				this.newImported,
				this.adType,
				this.highQuality,
				this.privacy,
				this.ordered,
				this.anonimous,
				this.coverStatus,
				this.recommendInfo,
				this.shareCount,
				this.coverImgIdStr,
				this.commentCount,
				this.copywriter,
				this.tag});

	Playlists.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		trackNumberUpdateTime = json['trackNumberUpdateTime'];
		status = json['status'];
		userId = json['userId'];
		createTime = json['createTime'];
		updateTime = json['updateTime'];
		subscribedCount = json['subscribedCount'];
		trackCount = json['trackCount'];
		cloudTrackCount = json['cloudTrackCount'];
		coverImgUrl = json['coverImgUrl'];
		coverImgId = json['coverImgId'];
		description = json['description'];
		tags = json['tags'].cast<String>();
		playCount = json['playCount'];
		trackUpdateTime = json['trackUpdateTime'];
		specialType = json['specialType'];
		totalDuration = json['totalDuration'];
		creator =
		json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
		tracks = json['tracks'];
		if (json['subscribers'] != null) {
			subscribers = new List<Subscribers>();
			json['subscribers'].forEach((v) {
				subscribers.add(new Subscribers.fromJson(v));
			});
		}
		subscribed = json['subscribed'];
		commentThreadId = json['commentThreadId'];
		newImported = json['newImported'];
		adType = json['adType'];
		highQuality = json['highQuality'];
		privacy = json['privacy'];
		ordered = json['ordered'];
		anonimous = json['anonimous'];
		coverStatus = json['coverStatus'];
		recommendInfo = json['recommendInfo'];
		shareCount = json['shareCount'];
		coverImgIdStr = json['coverImgId_str'];
		commentCount = json['commentCount'];
		copywriter = json['copywriter'];
		tag = json['tag'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
		data['status'] = this.status;
		data['userId'] = this.userId;
		data['createTime'] = this.createTime;
		data['updateTime'] = this.updateTime;
		data['subscribedCount'] = this.subscribedCount;
		data['trackCount'] = this.trackCount;
		data['cloudTrackCount'] = this.cloudTrackCount;
		data['coverImgUrl'] = this.coverImgUrl;
		data['coverImgId'] = this.coverImgId;
		data['description'] = this.description;
		data['tags'] = this.tags;
		data['playCount'] = this.playCount;
		data['trackUpdateTime'] = this.trackUpdateTime;
		data['specialType'] = this.specialType;
		data['totalDuration'] = this.totalDuration;
		if (this.creator != null) {
			data['creator'] = this.creator.toJson();
		}
		data['tracks'] = this.tracks;
		if (this.subscribers != null) {
			data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
		}
		data['subscribed'] = this.subscribed;
		data['commentThreadId'] = this.commentThreadId;
		data['newImported'] = this.newImported;
		data['adType'] = this.adType;
		data['highQuality'] = this.highQuality;
		data['privacy'] = this.privacy;
		data['ordered'] = this.ordered;
		data['anonimous'] = this.anonimous;
		data['coverStatus'] = this.coverStatus;
		data['recommendInfo'] = this.recommendInfo;
		data['shareCount'] = this.shareCount;
		data['coverImgId_str'] = this.coverImgIdStr;
		data['commentCount'] = this.commentCount;
		data['copywriter'] = this.copywriter;
		data['tag'] = this.tag;
		return data;
	}
}

class Creator {
	bool defaultAvatar;
	int province;
	int authStatus;
	bool followed;
	String avatarUrl;
	int accountStatus;
	int gender;
	int city;
	int birthday;
	int userId;
	int userType;
	String nickname;
	String signature;
	String description;
	String detailDescription;
	int avatarImgId;
	int backgroundImgId;
	String backgroundUrl;
	int authority;
	bool mutual;
	List<String> expertTags;
	int djStatus;
	int vipType;
	Null remarkName;
	String avatarImgIdStr;
	String backgroundImgIdStr;

	Creator(
			{this.defaultAvatar,
				this.province,
				this.authStatus,
				this.followed,
				this.avatarUrl,
				this.accountStatus,
				this.gender,
				this.city,
				this.birthday,
				this.userId,
				this.userType,
				this.nickname,
				this.signature,
				this.description,
				this.detailDescription,
				this.avatarImgId,
				this.backgroundImgId,
				this.backgroundUrl,
				this.authority,
				this.mutual,
				this.expertTags,
				this.djStatus,
				this.vipType,
				this.remarkName,
				this.avatarImgIdStr,
				this.backgroundImgIdStr,});

	Creator.fromJson(Map<String, dynamic> json) {
		defaultAvatar = json['defaultAvatar'];
		province = json['province'];
		authStatus = json['authStatus'];
		followed = json['followed'];
		avatarUrl = json['avatarUrl'];
		accountStatus = json['accountStatus'];
		gender = json['gender'];
		city = json['city'];
		birthday = json['birthday'];
		userId = json['userId'];
		userType = json['userType'];
		nickname = json['nickname'];
		signature = json['signature'];
		description = json['description'];
		detailDescription = json['detailDescription'];
		avatarImgId = json['avatarImgId'];
		backgroundImgId = json['backgroundImgId'];
		backgroundUrl = json['backgroundUrl'];
		authority = json['authority'];
		mutual = json['mutual'];
		djStatus = json['djStatus'];
		vipType = json['vipType'];
		remarkName = json['remarkName'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		avatarImgIdStr = json['avatarImgId_str'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['defaultAvatar'] = this.defaultAvatar;
		data['province'] = this.province;
		data['authStatus'] = this.authStatus;
		data['followed'] = this.followed;
		data['avatarUrl'] = this.avatarUrl;
		data['accountStatus'] = this.accountStatus;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['birthday'] = this.birthday;
		data['userId'] = this.userId;
		data['userType'] = this.userType;
		data['nickname'] = this.nickname;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['detailDescription'] = this.detailDescription;
		data['avatarImgId'] = this.avatarImgId;
		data['backgroundImgId'] = this.backgroundImgId;
		data['backgroundUrl'] = this.backgroundUrl;
		data['authority'] = this.authority;
		data['mutual'] = this.mutual;
		data['djStatus'] = this.djStatus;
		data['vipType'] = this.vipType;
		data['remarkName'] = this.remarkName;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['avatarImgId_str'] = this.avatarImgIdStr;
		return data;
	}
}

class Subscribers {
	bool defaultAvatar;
	int province;
	int authStatus;
	bool followed;
	String avatarUrl;
	int accountStatus;
	int gender;
	int city;
	int birthday;
	int userId;
	int userType;
	String nickname;
	String signature;
	String description;
	String detailDescription;
	int avatarImgId;
	int backgroundImgId;
	String backgroundUrl;
	int authority;
	bool mutual;
	Null expertTags;
	Null experts;
	int djStatus;
	int vipType;
	Null remarkName;
	String avatarImgIdStr;
	String backgroundImgIdStr;

	Subscribers(
			{this.defaultAvatar,
				this.province,
				this.authStatus,
				this.followed,
				this.avatarUrl,
				this.accountStatus,
				this.gender,
				this.city,
				this.birthday,
				this.userId,
				this.userType,
				this.nickname,
				this.signature,
				this.description,
				this.detailDescription,
				this.avatarImgId,
				this.backgroundImgId,
				this.backgroundUrl,
				this.authority,
				this.mutual,
				this.expertTags,
				this.experts,
				this.djStatus,
				this.vipType,
				this.remarkName,
				this.avatarImgIdStr,
				this.backgroundImgIdStr,});

	Subscribers.fromJson(Map<String, dynamic> json) {
		defaultAvatar = json['defaultAvatar'];
		province = json['province'];
		authStatus = json['authStatus'];
		followed = json['followed'];
		avatarUrl = json['avatarUrl'];
		accountStatus = json['accountStatus'];
		gender = json['gender'];
		city = json['city'];
		birthday = json['birthday'];
		userId = json['userId'];
		userType = json['userType'];
		nickname = json['nickname'];
		signature = json['signature'];
		description = json['description'];
		detailDescription = json['detailDescription'];
		avatarImgId = json['avatarImgId'];
		backgroundImgId = json['backgroundImgId'];
		backgroundUrl = json['backgroundUrl'];
		authority = json['authority'];
		mutual = json['mutual'];
		expertTags = json['expertTags'];
		experts = json['experts'];
		djStatus = json['djStatus'];
		vipType = json['vipType'];
		remarkName = json['remarkName'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		avatarImgIdStr = json['avatarImgId_str'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['defaultAvatar'] = this.defaultAvatar;
		data['province'] = this.province;
		data['authStatus'] = this.authStatus;
		data['followed'] = this.followed;
		data['avatarUrl'] = this.avatarUrl;
		data['accountStatus'] = this.accountStatus;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['birthday'] = this.birthday;
		data['userId'] = this.userId;
		data['userType'] = this.userType;
		data['nickname'] = this.nickname;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['detailDescription'] = this.detailDescription;
		data['avatarImgId'] = this.avatarImgId;
		data['backgroundImgId'] = this.backgroundImgId;
		data['backgroundUrl'] = this.backgroundUrl;
		data['authority'] = this.authority;
		data['mutual'] = this.mutual;
		data['expertTags'] = this.expertTags;
		data['experts'] = this.experts;
		data['djStatus'] = this.djStatus;
		data['vipType'] = this.vipType;
		data['remarkName'] = this.remarkName;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['avatarImgId_str'] = this.avatarImgIdStr;
		return data;
	}
}
