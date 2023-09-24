class MedicineModel {
  String? medicineId;
  String? medicineName;
  String? medicineType;
  String? healthCondition;
  String? usersId;
  String? medicineCreate;

  MedicineModel(
      {this.medicineId,
        this.medicineName,
        this.medicineType,
        this.healthCondition,
        this.usersId,
        this.medicineCreate});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicine_id'];
    medicineName = json['medicine_name'];
    medicineType = json['medicine_type'];
    healthCondition = json['HealthCondition'];
    usersId = json['users_id'];
    medicineCreate = json['medicine_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medicine_id'] = this.medicineId;
    data['medicine_name'] = this.medicineName;
    data['medicine_type'] = this.medicineType;
    data['HealthCondition'] = this.healthCondition;
    data['users_id'] = this.usersId;
    data['medicine_create'] = this.medicineCreate;
    return data;
  }
}