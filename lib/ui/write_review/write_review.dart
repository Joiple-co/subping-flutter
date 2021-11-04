import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/write_review/write_review_viewmodel.dart';

class WriteReview extends StatelessWidget {
  final initialRating = Get.arguments['rating'];

  WriteReview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final writeReviewViweModel = Get.find<WriteReviewViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TitleAppBar("리뷰하기"),
      body: HeaderSafe(
        hasBottomSafe: true,
        child: HorizontalPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(size: SubpingSize.medium14),
                  Text.rich(SubpingTextSpan(children: [
                    SubpingTextSpan(
                        text: "서비스에 대한\n",
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold),
                    SubpingTextSpan(
                        text: "리뷰",
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold,
                        color: SubpingColor.subping100),
                    SubpingTextSpan(
                        text: "를 입력해주세요!",
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold),
                  ])),
                  Space(size: SubpingSize.medium14),
                  Center(
                    child: RatingBar.builder(
                        updateOnDrag: true,
                        ignoreGestures: false,
                        initialRating: initialRating,
                        itemSize: 50,
                        glow: false,
                        allowHalfRating: true,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: SubpingColor.subping100),
                        onRatingUpdate: (rating) {}),
                  ),
                  Space(size: SubpingSize.medium14),
                  const SubpingTextField(hintText: "제목", maxLines: 1),
                  Space(size: SubpingSize.medium14),
                  const SubpingTextField(
                    hintText: "내용",
                    maxLines: 8,
                  ),
                  Space(size: SubpingSize.medium14),
                  ImageSelector(
                    images: writeReviewViweModel.images,
                    onClickDelete: writeReviewViweModel.onClickDelete,
                    onSelectImage: writeReviewViweModel.onSelectImage,
                  )
                ],
              ),
              Column(
                children: [
                  SquareButton(
                    text: "리뷰하기",
                    onPressed: () {},
                  ),
                  Space(size: SubpingSize.large20)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
