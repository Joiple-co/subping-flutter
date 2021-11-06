import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:subping/model/gallery_model.dart';

class SubpingMethodChannel {
  static const platform = MethodChannel("com.subping.SubpingmethodChannel");

  // ignore: missing_return
  static Future<List<GalleryModel>> getImageItemFromGallery() async {
    List<GalleryModel> imageBytesList = <GalleryModel>[];

    Map<Permission, PermissionStatus> storagePermission =
        await [Permission.storage].request();

    if (storagePermission[Permission.storage].isGranted) {
      try {
        final result = await platform.invokeMethod("getGalleryItems");
        result.forEach((imageItem) {
          imageBytesList
              .add(GalleryModel.fromJson(Map<String, dynamic>.from(imageItem)));
        });
        return imageBytesList;
      } catch (e) {
        return imageBytesList;
      }
    }
  }

  static Future<int> getImagesCountFromGallery() async {
    int imageCount;
    try {
      imageCount = await platform.invokeMethod("getGalleryCount");
      return imageCount;
    } catch (e) {
      return 0;
    }
  }
}
