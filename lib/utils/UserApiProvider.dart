import 'package:dio/dio.dart';
import 'package:flutter_app/model/HappyDayResponse.dart';

class UserApiProvider{
  final String _endpoint = "https://raw.githubusercontent.com/oNguyenDucManh/AlifeFlutter/master/json/happydays.json";
  final Dio _dio = Dio();

  Future<HappyDayResponse> getListHappyDay() async {
    try {
      Response response = await _dio.get(_endpoint);
      return HappyDayResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return HappyDayResponse.withError("$error");
    }
  }
}