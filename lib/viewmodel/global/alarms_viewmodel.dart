import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/alarms/alarms_model.dart';
import 'package:subping/repository/alarm_repository.dart';

class AlarmsViewModel extends GetxController {
  AlarmRepository _alarmRepository = AlarmRepository();
  Rx<AlarmsModel> alarms = AlarmsModel().obs;

  void updateAlarm() async {
    alarms.value = await _alarmRepository.getAlarm();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
