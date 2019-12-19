class RecommendPlaylistEntity {
	List<RecommandPlaylistResult> result;
	int code;
	bool hasTaste;
	int category;

	RecommendPlaylistEntity({this.result, this.code, this.hasTaste, this.category});

	RecommendPlaylistEntity.fromJson(Map<String, dynamic> json) {
		if (json['result'] != null) {
			result = new List<RecommandPlaylistResult>();(json['result'] as List).forEach((v) { result.add(new RecommandPlaylistResult.fromJson(v)); });
		}
		code = json['code'];
		hasTaste = json['hasTaste'];
		category = json['category'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] =  this.result.map((v) => v.toJson()).toList();
    }
		data['code'] = this.code;
		data['hasTaste'] = this.hasTaste;
		data['category'] = this.category;
		return data;
	}
}

class RecommandPlaylistResult {
	String picUrl;
	int playCount;
	int trackCount;
	bool canDislike;
	String name;
	String copywriter;
	bool highQuality;
	int id;
	int type;
	int trackNumberUpdateTime;
	String alg;

	RecommandPlaylistResult({this.picUrl, this.playCount, this.trackCount, this.canDislike, this.name, this.copywriter, this.highQuality, this.id, this.type, this.trackNumberUpdateTime, this.alg});

	RecommandPlaylistResult.fromJson(Map<String, dynamic> json) {
		picUrl = json['picUrl'];
		playCount = json['playCount'];
		trackCount = json['trackCount'];
		canDislike = json['canDislike'];
		name = json['name'];
		copywriter = json['copywriter'];
		highQuality = json['highQuality'];
		id = json['id'];
		type = json['type'];
		trackNumberUpdateTime = json['trackNumberUpdateTime'];
		alg = json['alg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picUrl'] = this.picUrl;
		data['playCount'] = this.playCount;
		data['trackCount'] = this.trackCount;
		data['canDislike'] = this.canDislike;
		data['name'] = this.name;
		data['copywriter'] = this.copywriter;
		data['highQuality'] = this.highQuality;
		data['id'] = this.id;
		data['type'] = this.type;
		data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
		data['alg'] = this.alg;
		return data;
	}
}
