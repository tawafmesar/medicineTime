class AlarmModel {
  String? alarmId;
  String? alarmTitle;
  String? alarmTime;
  String? usersId;
  String? alarmCreate;

  AlarmModel(
      {this.alarmId,
        this.alarmTitle,
        this.alarmTime,
        this.usersId,
        this.alarmCreate});

  AlarmModel.fromJson(Map<String, dynamic> json) {
    alarmId = json['alarm_id'];
    alarmTitle = json['alarm_title'];
    alarmTime = json['alarm_time'];
    usersId = json['users_id'];
    alarmCreate = json['alarm_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alarm_id'] = this.alarmId;
    data['alarm_title'] = this.alarmTitle;
    data['alarm_time'] = this.alarmTime;
    data['users_id'] = this.usersId;
    data['alarm_create'] = this.alarmCreate;
    return data;
  }
}