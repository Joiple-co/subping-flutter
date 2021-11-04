import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/gallery/galleryItem.dart';
import 'package:subping/ui/gallery/picked_image_list.dart';
import 'package:subping/viewmodel/local/write_review/gallery_viewmodel.dart';

class Gallery extends StatelessWidget {
  Function callback;

  Gallery({this.callback});

  @override
  Widget build(BuildContext context) {
    final galleryController = Get.put(GalleryViewModel());

    return Obx(() => Scaffold(
        backgroundColor: SubpingColor.white100,
        appBar: TitleAppBar(
          "갤러리",
          hasBackButton: true,
          rear: GestureDetector(
            onTap: () async {
              if (galleryController.imagePickedList.length == 0 || false) {
                galleryController.showToast("선택한 이미지가 없습니다.");
                return;
              }
              await this.callback(galleryController.imagePickedList);
              Get.back();
            },
            child: SubpingText(
              "확인",
              fontWeight: SubpingFontWeight.regular,
              color: SubpingColor.subping100,
            ),
          ),
        ),
        body: galleryController.isLoading
            ? SubpingLoading()
            : Column(
                children: [
                  PickedImageList(
                    imagePickedList: galleryController.imagePickedList,
                    onTouchItem: galleryController.onTogglePick,
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        children: [
                          GestureDetector(
                            onTap: () {
                              galleryController.onTakeImage();
                            },
                            child: Container(
                              color: SubpingColor.black30,
                              child: Icon(Icons.camera_alt_rounded,
                                  size: 32, color: SubpingColor.black60),
                            ),
                          ),
                          ...List.generate(
                              galleryController.receivedImageList.length,
                              (index) {
                            return GalleryItem(
                                source:
                                    galleryController.receivedImageList[index],
                                onTogglePick: galleryController.onTogglePick,
                                selectedIndex: galleryController
                                    .calculateSelectIndex(galleryController
                                        .receivedImageList[index].id));
                          })
                        ]),
                  )
                ],
              )));
  }
}
