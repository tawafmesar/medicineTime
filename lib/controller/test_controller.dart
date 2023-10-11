import 'package:medicinetime/core/class/statusrequest.dart';
import 'package:medicinetime/core/functions/handingdatacontroller.dart';
import 'package:medicinetime/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';
import 'package:medicinetime/data/datasource/remote/updatedaily_data.dart';
class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  UpdateDaily updatee = UpdateDaily(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  updateDaily() async {
    statusRequest = StatusRequest.loading;
    var response = await updatee.updatedaily();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}