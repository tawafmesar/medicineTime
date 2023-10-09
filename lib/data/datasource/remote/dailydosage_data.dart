import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class DailyDosageData {
  Crud crud;
  DailyDosageData(this.crud);
  addData(String itemsid) async {
    var response = await crud.postData(AppLink.dosage, {"itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
  }
}