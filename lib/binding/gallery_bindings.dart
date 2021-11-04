import 'package:get/get.dart';
import 'package:subping/viewmodel/local/write_review/gallery_viewmodel.dart';

class GalleryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GalleryViewModel());
  }
}
