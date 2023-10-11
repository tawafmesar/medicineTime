import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class UpdateDaily {
  Crud crud;
  UpdateDaily(this.crud);
  updatedaily() async {
    var response = await crud.postData(AppLink.updateDaily, {});
    return response.fold((l) => l, (r) => r);
  }
}