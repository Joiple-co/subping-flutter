import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/write_review/write_review_viewmodel.dart';

class WriteReview extends StatelessWidget {
  WriteReview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final writeReviewViewModel = Get.find<WriteReviewViewModel>();

    return Obx(() => Scaffold(
        body: Container(
          child: Center(child: ImageSelector(images: writeReviewViewModel.images, onSelectImage: writeReviewViewModel.onSelectImage, onClickDelete: writeReviewViewModel.onClickDelete,))
          )
      ),
    );
  }
}
