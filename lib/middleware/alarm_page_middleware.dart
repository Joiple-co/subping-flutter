import 'package:get/route_manager.dart';
import 'package:subping/viewmodel/global/alarms_viewmodel.dart';
import 'package:get/get.dart';

class AlarmMiddleWare extends GetMiddleware {
  @override
  void onPageDispose() async {
    final alarmViewModel = Get.find<AlarmsViewModel>();
    
    await alarmViewModel.readAlarm();
  }
}