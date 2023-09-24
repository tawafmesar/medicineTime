import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class MedicineData {
  Crud crud;
  MedicineData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.medicineview, {"id":id});
    return response.fold((l) => l, (r) => r);
  }
}