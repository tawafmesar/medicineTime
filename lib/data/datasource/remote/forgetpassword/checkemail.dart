import 'package:medicinetime/core/class/crud.dart';
import 'package:medicinetime/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email" : email
    });
    return response.fold((l) => l, (r) => r);
  }
}