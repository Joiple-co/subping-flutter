import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WriteReviewViewModel extends GetxController {
  RxList<XFile> _images = <XFile>[].obs;

  Future<void> onSelectImage(List<XFile> selectedImages) {
    _images.value = [
      ..._images.value,
      ...selectedImages
    ];

    _images.refresh();
  }

  Future<void> onClickDelete(int index) {
    _images.value.removeAt(index);

    _images.refresh();
  }

  List<XFile> get images {
    return _images.value;
  }
}
