import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/write_review/write_review_bottomsheet_viewmodel.dart';

class WriteReviewBottomSheet extends StatelessWidget {
  final String serviceId;
  WriteReviewBottomSheet({Key key, this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 이 화면은 스크린이 아니고 뷰모델의 샘명주기를 길게 관리할 필요가 없음.
    // 따라서 뷰모델을 위젯에서 직접 인스턴스화 진행.
    final writeReviewBottomSheetViewModel =
        Get.put(WriteReviewBottomSheetViewModel());

    return HeaderSafe(
      hasBottomSafe: true,
      child: HorizontalPadding(
        child: Container(
          height: 260,
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
                        text: "평점",
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold,
                        color: SubpingColor.subping100),
                    SubpingTextSpan(
                        text: "을 입력해주세요!",
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold),
                  ])),
                  Space(size: SubpingSize.medium14),
                  Center(
                      child: RatingBar.builder(
                    updateOnDrag: true,
                    ignoreGestures: false,
                    initialRating: 5,
                    itemSize: 50,
                    glow: false,
                    allowHalfRating: true,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: SubpingColor.subping100),
                    onRatingUpdate:
                        writeReviewBottomSheetViewModel.onChangeRating,
                  ))
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SquareButton(
                        text: "별점 리뷰하기",
                        onPressed: () {},
                        type: "outline",
                        twoButton: true,
                      ),
                      Space(
                        size: SubpingSize.medium10,
                      ),
                      SquareButton(
                        text: "상세 리뷰하기",
                        onPressed: () => Get.toNamed('/writeReview',
                            arguments: {
                              "rating": writeReviewBottomSheetViewModel.rating,
                              "serviceId": serviceId
                            }),
                        twoButton: true,
                      )
                    ],
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
