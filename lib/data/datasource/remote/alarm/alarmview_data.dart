import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class AlarmViewData {
  Crud crud;
  AlarmViewData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.alarmview, {"id":id});
    return response.fold((l) => l, (r) => r);
  }
}