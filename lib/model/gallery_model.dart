import 'dart:typed_data';

class GalleryModel {
  Uint8List imagesource;
  String id;
  int created;
  String location;

  GalleryModel({
    this.imagesource,
    this.id,
    this.created,
    this.location,
  });
  GalleryModel.fromJson(Map<String, dynamic> json) {
    imagesource = json['data'];
    id = json['id'];
    created = json['created'];
    location = json['location'];
  }
}
