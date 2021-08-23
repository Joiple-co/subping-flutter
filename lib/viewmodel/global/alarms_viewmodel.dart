import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/model/alarms/alarms_model.dart';
import 'package:subping/repository/alarm_repository.dart';

class AlarmsViewModel extends GetxController {
  AlarmRepository _alarmRepository = AlarmRepository();
  Rx<AlarmsModel> alarms = AlarmsModel().obs;
  Rx<bool> _isLoading = false.obs;

  Future<void> updateAlarm() async {
    try {
      _isLoading = true.obs;

      alarms.value = await _alarmRepository.getAlarm();
      
      _isLoading = false.obs;
    } catch (e) {
      print(e);
    }
  }

  Future<void> readAlarm() async {
    await _alarmRepository.readAlarm();
    alarms.value.unreadAlarms = 0;
    alarms.refresh();
  }

  bool get isLoading {
    return _isLoading.value;
  }

  @override
  void onInit() {
    super.onInit();
    updateAlarm();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
