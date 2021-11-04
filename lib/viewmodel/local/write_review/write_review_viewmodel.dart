import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WriteReviewViewModel extends GetxController {
  final RxList<XFile> _images = <XFile>[].obs;

  Future<void> onSelectImage(List<XFile> selectedImages) async {
    _images.value = [..._images, ...selectedImages];

    _images.refresh();
  }

  Future<void> onClickDelete(int index) async {
    _images.removeAt(index);

    _images.refresh();
  }

  List<XFile> get images {
    return _images;
  }
}
