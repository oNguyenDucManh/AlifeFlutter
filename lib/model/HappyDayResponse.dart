class HappyDayResponse {
  List<HappyDayModel> data;
  String error;

  HappyDayResponse({this.data});

  HappyDayResponse.fromJson(Map<String, dynamic> json) {
    this.data = (json['data'] as List) != null
        ? (json['data'] as List).map((i) => HappyDayModel.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }

  HappyDayResponse.withError(String errorValue)
      : data = List(),
        error = errorValue;
}

class HappyDayModel {
  String imgUrl;
  String title;
  bool isHideTwister;
  bool isHideInstagram;
  bool isHideFacebook;
  int countLike;

  HappyDayModel(
      {this.imgUrl,
      this.title,
      this.isHideTwister,
      this.isHideInstagram,
      this.isHideFacebook,
      this.countLike});

  HappyDayModel.fromJson(Map<String, dynamic> json) {
    this.imgUrl = json['imgUrl'];
    this.title = json['title'];
    this.isHideTwister = json['isHideTwister'];
    this.isHideInstagram = json['isHideInstagram'];
    this.isHideFacebook = json['isHideFacebook'];
    this.countLike = json['countLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['isHideTwister'] = this.isHideTwister;
    data['isHideInstagram'] = this.isHideInstagram;
    data['isHideFacebook'] = this.isHideFacebook;
    data['countLike'] = this.countLike;
    return data;
  }
}
