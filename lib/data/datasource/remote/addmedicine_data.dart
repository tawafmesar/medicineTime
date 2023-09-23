import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class AddMedicineData {
  Crud crud;
  AddMedicineData(this.crud);
  postdata(String medicine_name ,String medicine_type ,String HealthCondition ,String users_id ) async {
    var response = await crud.postData(AppLink.addmedicine, {
      "medicine_name" : medicine_name ,
      "medicine_type" : medicine_type  ,
      "HealthCondition" : HealthCondition ,
      "users_id" : users_id  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}