import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ImageSelector extends StatelessWidget {
  final List<XFile> images;
  // pickedImages는 반드시 List<XFile>을 인자로 받아야 함.
  // 예 ) (List<XFile> pickedImages) => void
  final Function onSelectImage;
final Function onClickDelete;

  const ImageSelector({Key key, this.images, this.onSelectImage, this.onClickDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          ...List.generate(
              images.length,
              (index) => Row(children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(File(images[index].path),
                            width: 75, height: 75, fit: BoxFit.fill),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => onClickDelete(index),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: SubpingColor.warning100),
                              child: ClipOval(
                                  child: Icon(
                                Icons.remove_sharp,
                                color: SubpingColor.white100,
                              )),
                            ),
                          )),
                    ]),
                    Space(
                      size: SubpingSize.medium10,
                    )
                  ])),
          GestureDetector(
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final pickedImages =
                  await _picker.pickMultiImage(imageQuality: 25);

              if (pickedImages != null) {
                onSelectImage(pickedImages);
              }
            },
            child: Container(
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: SubpingColor.black30,
                ),
                child: Center(
                  child: Icon(
                    Icons.add_outlined,
                    color: SubpingColor.black60
                  ),
                )),
          )
        ]));
  }
}
