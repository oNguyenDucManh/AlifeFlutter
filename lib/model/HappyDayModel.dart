class HappyDayModel {
  int countLike;
  String imgUrl;
  String title;
  bool isHideTwister = false;
  bool isHideInstagram = false;
  bool isHideFacebook = false;

  HappyDayModel(this.countLike, this.imgUrl, this.title, this.isHideTwister,
      this.isHideInstagram, this.isHideFacebook);

  HappyDayModel.fromJson(Map<String, dynamic> json)
      : countLike = json["countLike"],
        imgUrl = json["imgUrl"],
        title = json["title"],
        isHideTwister = json["isHideTwister"],
        isHideInstagram = json["isHideInstagram"],
        isHideFacebook = json["isHideFacebook"];
}
