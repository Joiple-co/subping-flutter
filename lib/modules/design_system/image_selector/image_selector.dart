import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/gallery/gallery.dart';
import 'package:subping/viewmodel/local/write_review/write_review_viewmodel.dart';

class ImageSelector extends StatelessWidget {
  final WriteReviewViewModel writeReviewViewModel;
  final List<GalleryModel> images;
  final Function onSelectImage;
  final Function onClickDelete;

  const ImageSelector(
      {Key key,
      this.writeReviewViewModel,
      this.images,
      this.onSelectImage,
      this.onClickDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Gallery(
                              callback: (imageList) {
                                writeReviewViewModel.uploadImages = imageList;
                              },
                            )));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: SubpingColor.black100, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      color: SubpingColor.white100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_rounded,
                            color: SubpingColor.black60),
                        SubpingText(
                          "사진 ${writeReviewViewModel.images.length}/5",
                        )
                      ],
                    ),
                  )),
              ...List.generate(
                  writeReviewViewModel.images.length,
                  (index) => Row(children: [
                        Space(
                          size: SubpingSize.medium10,
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.memory(
                              writeReviewViewModel.images[index].imagesource,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap: () => onClickDelete(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: SubpingColor.warning100),
                                  child: ClipOval(
                                      child: Icon(
                                    Icons.remove_sharp,
                                    size: 20,
                                    color: SubpingColor.white100,
                                  )),
                                ),
                              )),
                        ]),
                      ])),
            ]));
  }
}
