import 'package:get/route_manager.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:get/get.dart';

class ServiceDetailMiddleWare extends GetMiddleware {
  @override
  void onPageDispose() {
    final serviceViewModel = Get.find<ServiceViewModel>();
    serviceViewModel.synchronizeLike();
  }
}
