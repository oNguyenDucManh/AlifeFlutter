import 'package:flutter_app/model/HappyDayResponse.dart';
import 'package:flutter_app/utils/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<HappyDayResponse> _subject =
  BehaviorSubject<HappyDayResponse>();

  getListHappyDay() async {
    HappyDayResponse response = await _repository.getListHappyDay();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<HappyDayResponse> get subject => _subject;

}
final bloc = UserBloc();