import 'package:flutter_app/model/HappyDayResponse.dart';
import 'package:flutter_app/utils/UserApiProvider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<HappyDayResponse> getListHappyDay(){
    return _apiProvider.getListHappyDay();
  }
}