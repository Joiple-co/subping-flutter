import 'package:get/get.dart';
import 'package:subping/viewmodel/local/like_service/like_service_viewmodel.dart';

class LikeServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LikeServiceViewModel());
  }
}
