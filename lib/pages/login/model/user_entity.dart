class UserEntity {
	int code;
	int loginType;
	String message;
	UserProfile profile;
	List<UserBinding> bindings;
	UserAccount account;

	UserEntity({this.code, this.loginType, this.message,this.profile, this.bindings, this.account});

	UserEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		message = json['message'];
		loginType = json['loginType'];
		profile = json['profile'] != null ? new UserProfile.fromJson(json['profile']) : null;
		if (json['bindings'] != null) {
			bindings = new List<UserBinding>();(json['bindings'] as List).forEach((v) { bindings.add(new UserBinding.fromJson(v)); });
		}
		account = json['account'] != null ? new UserAccount.fromJson(json['account']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['loginType'] = this.loginType;
		data['message'] = this.message;
		if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
		if (this.bindings != null) {
      data['bindings'] =  this.bindings.map((v) => v.toJson()).toList();
    }
		if (this.account != null) {
      data['account'] = this.account.toJson();
    }
		return data;
	}
}

class UserProfile {
	String detailDescription;
	String backgroundUrl;
	int birthday;
	int gender;
	int city;
	String signature;
	int followeds;
	String description;
	dynamic remarkName;
	int eventCount;
	int playlistBeSubscribedCount;
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
	int follows;
	int vipType;
	bool followed;
	int userId;
	bool mutual;
	String avatarimgidStr;
	int authority;
	int backgroundImgId;
	int userType;
	UserProfileExperts experts;
	int playlistCount;

	UserProfile({this.detailDescription, this.backgroundUrl, this.birthday, this.gender, this.city, this.signature, this.followeds, this.description, this.remarkName, this.eventCount, this.playlistBeSubscribedCount, this.accountStatus, this.avatarImgId, this.defaultAvatar, this.avatarImgIdStr, this.backgroundImgIdStr, this.province, this.nickname, this.expertTags, this.djStatus, this.avatarUrl, this.authStatus, this.follows, this.vipType, this.followed, this.userId, this.mutual, this.avatarimgidStr, this.authority, this.backgroundImgId, this.userType, this.experts, this.playlistCount});

	UserProfile.fromJson(Map<String, dynamic> json) {
		detailDescription = json['detailDescription'];
		backgroundUrl = json['backgroundUrl'];
		birthday = json['birthday'];
		gender = json['gender'];
		city = json['city'];
		signature = json['signature'];
		followeds = json['followeds'];
		description = json['description'];
		remarkName = json['remarkName'];
		eventCount = json['eventCount'];
		playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
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
		follows = json['follows'];
		vipType = json['vipType'];
		followed = json['followed'];
		userId = json['userId'];
		mutual = json['mutual'];
		avatarimgidStr = json['avatarImgId_str'];
		authority = json['authority'];
		backgroundImgId = json['backgroundImgId'];
		userType = json['userType'];
		experts = json['experts'] != null ? new UserProfileExperts.fromJson(json['experts']) : null;
		playlistCount = json['playlistCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['detailDescription'] = this.detailDescription;
		data['backgroundUrl'] = this.backgroundUrl;
		data['birthday'] = this.birthday;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['followeds'] = this.followeds;
		data['description'] = this.description;
		data['remarkName'] = this.remarkName;
		data['eventCount'] = this.eventCount;
		data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
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
		data['follows'] = this.follows;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['avatarImgId_str'] = this.avatarimgidStr;
		data['authority'] = this.authority;
		data['backgroundImgId'] = this.backgroundImgId;
		data['userType'] = this.userType;
		if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
		data['playlistCount'] = this.playlistCount;
		return data;
	}
}

class UserProfileExperts {


	UserProfileExperts();

	UserProfileExperts.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}

class UserBinding {
	int expiresIn;
	bool expired;
	String tokenJsonStr;
	int refreshTime;
	int id;
	int type;
	int bindingTime;
	int userId;
	String url;

	UserBinding({this.expiresIn, this.expired, this.tokenJsonStr, this.refreshTime, this.id, this.type, this.bindingTime, this.userId, this.url});

	UserBinding.fromJson(Map<String, dynamic> json) {
		expiresIn = json['expiresIn'];
		expired = json['expired'];
		tokenJsonStr = json['tokenJsonStr'];
		refreshTime = json['refreshTime'];
		id = json['id'];
		type = json['type'];
		bindingTime = json['bindingTime'];
		userId = json['userId'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['expiresIn'] = this.expiresIn;
		data['expired'] = this.expired;
		data['tokenJsonStr'] = this.tokenJsonStr;
		data['refreshTime'] = this.refreshTime;
		data['id'] = this.id;
		data['type'] = this.type;
		data['bindingTime'] = this.bindingTime;
		data['userId'] = this.userId;
		data['url'] = this.url;
		return data;
	}
}

class UserAccount {
	String salt;
	int vipType;
	String userName;
	int type;
	int ban;
	bool anonimousUser;
	int createTime;
	int tokenVersion;
	int id;
	int whitelistAuthority;
	int baoyueVersion;
	int viptypeVersion;
	int donateVersion;
	int status;

	UserAccount({this.salt, this.vipType, this.userName, this.type, this.ban, this.anonimousUser, this.createTime, this.tokenVersion, this.id, this.whitelistAuthority, this.baoyueVersion, this.viptypeVersion, this.donateVersion, this.status});

	UserAccount.fromJson(Map<String, dynamic> json) {
		salt = json['salt'];
		vipType = json['vipType'];
		userName = json['userName'];
		type = json['type'];
		ban = json['ban'];
		anonimousUser = json['anonimousUser'];
		createTime = json['createTime'];
		tokenVersion = json['tokenVersion'];
		id = json['id'];
		whitelistAuthority = json['whitelistAuthority'];
		baoyueVersion = json['baoyueVersion'];
		viptypeVersion = json['viptypeVersion'];
		donateVersion = json['donateVersion'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['salt'] = this.salt;
		data['vipType'] = this.vipType;
		data['userName'] = this.userName;
		data['type'] = this.type;
		data['ban'] = this.ban;
		data['anonimousUser'] = this.anonimousUser;
		data['createTime'] = this.createTime;
		data['tokenVersion'] = this.tokenVersion;
		data['id'] = this.id;
		data['whitelistAuthority'] = this.whitelistAuthority;
		data['baoyueVersion'] = this.baoyueVersion;
		data['viptypeVersion'] = this.viptypeVersion;
		data['donateVersion'] = this.donateVersion;
		data['status'] = this.status;
		return data;
	}
}
