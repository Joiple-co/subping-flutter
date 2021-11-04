import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class SubpingMethodChannel {
  static const platform =
      const MethodChannel("com.subping.SubpingmethodChannel");

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
      print(e);
      return imageCount;
    }
  }
}
