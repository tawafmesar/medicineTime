import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class AddAlarmData {
  Crud crud;
  AddAlarmData(this.crud);
  postdata(String alarm_title ,String alarm_time  ,String users_id ) async {
    var response = await crud.postData(AppLink.addalarm, {
      "alarm_title" : alarm_title ,
      "alarm_time" : alarm_time  ,
      "users_id" : users_id  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}