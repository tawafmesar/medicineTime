

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class RemoveAlarmData {
  Crud crud;
  RemoveAlarmData(this.crud);


  removeAlarmData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.removealarm, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
