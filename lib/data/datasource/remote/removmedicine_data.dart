import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class RemoveMedicineData {
  Crud crud;
  RemoveMedicineData(this.crud);


  removeMedicineData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.removemedicine, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
