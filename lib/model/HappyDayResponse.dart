import 'package:flutter_app/model/HappyDayModel.dart';

class HappyDayResponse {
  final List<HappyDayModel> data;
  final String error;


  HappyDayResponse(this.data, this.error);

  HappyDayResponse.fromJson(Map<String, dynamic> json)
      : data =
  (json["data"] as List).map((i) => new HappyDayModel.fromJson(i)).toList(),
        error = "";

  HappyDayResponse.withError(String errorValue)
      : data = List(),
        error = errorValue;
}
