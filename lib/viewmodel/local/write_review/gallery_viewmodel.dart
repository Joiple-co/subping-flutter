import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:subping/methodChannel/subping_method_channel.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:image_picker/image_picker.dart';

class GalleryViewModel extends GetxController {
  RxBool _isLoading = false.obs;
  RxBool _isPicked = false.obs;
  RxList<GalleryModel> _receivedImageList = <GalleryModel>[].obs;
  RxList<GalleryModel> _imagePickedList = <GalleryModel>[].obs;
  int limitImageLenght = 5;

  void galleryInit() async {
    _isLoading.value = true;
    _receivedImageList.value =
        await SubpingMethodChannel.getImageItemFromGallery();
    _isPicked.value = false;
    _isLoading.value = false;
  }

  bool checkImageCount() => _imagePickedList.value.length >= limitImageLenght;

  void onTakeImage() async {
    var cameraImage =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    onTogglePick(
        new GalleryModel(
            imagesource: await cameraImage.readAsBytes(),
            location: cameraImage.path,
            created: int.parse(
                DateFormat("yyyymmdd").format(DateTime.now()).toString()),
            id: DateTime.now().toString()),
        false);
  }

  void onTogglePick(GalleryModel selectedGalleryModel, bool isPicked) {
    if (!isPicked) {
      if (checkImageCount()) {
        showToast("사진은 5개만 등록 가능해요!");
        return;
      }
      _imagePickedList.value = [
        ..._imagePickedList.value,
        selectedGalleryModel
      ];
      _imagePickedList.refresh();
    } else {
      _imagePickedList.value
          .removeWhere((element) => element.id == selectedGalleryModel.id);
      _imagePickedList.refresh();
    }
  }

  int calculateSelectIndex(String id) {
    return _imagePickedList.value.indexWhere((element) => element.id == id);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: SubpingColor.subping100,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER);
  }

  @override
  void onInit() {
    super.onInit();
    galleryInit();
    ever(_imagePickedList, (_) {
      _isPicked.value = _imagePickedList.value.length == 0 ? false : true;
    });
  }

  bool get isPicked {
    return _isPicked.value;
  }

  bool get isLoading {
    return _isLoading.value;
  }

  List<GalleryModel> get receivedImageList {
    return _receivedImageList.value;
  }

  List<GalleryModel> get imagePickedList {
    return _imagePickedList.value;
  }
}
