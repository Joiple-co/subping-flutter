import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/write_review/write_review_bottomsheet.dart';

class ServiceReview extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ServiceReview({this.reviews, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Space(size: SubpingSize.large25),
      HorizontalPadding(
        child: reviews.isEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(SubpingTextSpan(children: [
                    SubpingTextSpan(
                        text: "리뷰 ", fontSize: SubpingFontSize.title6),
                    SubpingTextSpan(
                        text: "${reviews.length}개",
                        fontSize: SubpingFontSize.title6,
                        color: SubpingColor.subping100)
                  ])),
                  GestureDetector(
                    onTap: () =>
                        Get.bottomSheet(const WriteReviewBottomSheet()),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          SubpingSize.medium10, 5, SubpingSize.medium10, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: SubpingColor.back20),
                      child: SubpingText(
                        '더보기',
                        color: SubpingColor.subping50,
                        size: SubpingFontSize.body3,
                        fontWeight: SubpingFontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
      Space(size: SubpingSize.large25),
    ]);
  }
}
