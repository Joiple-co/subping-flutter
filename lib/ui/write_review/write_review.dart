import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:subping/const/const.dart';
import 'package:subping/modules/design_system/loading/subping_loading.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/write_review/subscirbe_product_swiper.dart';
import 'package:subping/viewmodel/local/write_review/write_review_viewmodel.dart';

class WriteReview extends StatelessWidget {
  WriteReview({Key key}) : super(key: key);
  final initialRating = Get.arguments['rating'];
  final serviceId = Get.arguments["serviceId"];

  @override
  Widget build(BuildContext context) {
    final reviewViewModel = Get.find<WriteReviewViewModel>();
    reviewViewModel.getSubScribeData(serviceId);

    return Obx(
      () => Scaffold(
          appBar: const TitleAppBar(
            "리뷰 쓰기",
            hasBackButton: true,
          ),
          backgroundColor: SubpingColor.white100,
          body: KeyboardActions(
              autoScroll: false,
              config: KeyboardActionsConfig(actions: [
                KeyboardActionsItem(focusNode: reviewViewModel.reviewFocusNode)
              ]),
              child: SingleChildScrollView(
                controller: reviewViewModel.reviewScrollController,
                child: reviewViewModel.loading
                    ? const SubpingLoading()
                    : HeaderSafe(
                        child: HorizontalPadding(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Space(size: SubpingSize.large15),
                                SubScribeProductSwiper(
                                  subscribeModel:
                                      reviewViewModel.reviewProductData,
                                ),
                                Text.rich(SubpingTextSpan(children: [
                                  SubpingTextSpan(
                                      text: "상품에대한",
                                      fontSize: SubpingFontSize.title6,
                                      fontWeight: SubpingFontWeight.bold),
                                  SubpingTextSpan(
                                    text: " 만족도",
                                    fontSize: SubpingFontSize.title6,
                                    fontWeight: SubpingFontWeight.bold,
                                  ),
                                  SubpingTextSpan(
                                      text: "를 알려주세요!",
                                      fontSize: SubpingFontSize.title6,
                                      fontWeight: SubpingFontWeight.bold),
                                ])),
                                Space(size: SubpingSize.medium10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                        updateOnDrag: true,
                                        ignoreGestures: false,
                                        initialRating: 5,
                                        minRating: 1,
                                        itemSize: 80.w,
                                        glow: false,
                                        allowHalfRating: true,
                                        itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: SubpingColor.subping100),
                                        onRatingUpdate: (rating) {
                                          reviewViewModel.rating = rating;
                                        }),
                                    Space(size: SubpingSize.tiny6),
                                    SubpingText(
                                      ratingPharses[
                                          reviewViewModel.rating.round()],
                                      size: SubpingFontSize.body1,
                                      color: SubpingColor.black80,
                                    ),
                                  ],
                                ),
                                Space(
                                  size: SubpingSize.large15,
                                ),
                                SubpingText("상품 사진 업로드",
                                    size: SubpingFontSize.title6,
                                    fontWeight: SubpingFontWeight.bold),
                                Space(size: SubpingSize.tiny5),
                                SubpingText(
                                  "상품과 관련없는 이미지나 부적합한 이미지를 등록하실 경우\n사전경고 없이 등록된 이미지가 삭제될 수 있습니다.",
                                  color: SubpingColor.black60,
                                ),
                                Space(size: SubpingSize.large15),
                                ImageSelector(
                                  writeReviewViewModel: reviewViewModel,
                                  images: reviewViewModel.images,
                                  onClickDelete: reviewViewModel.onClickDelete,
                                ),
                                Space(size: SubpingSize.large15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SubpingText(
                                      "리뷰를 입력해주세요.",
                                      size: SubpingFontSize.title6,
                                      fontWeight: SubpingFontWeight.bold,
                                    ),
                                    SubpingText(
                                      "${reviewViewModel.reviewContent.length}자 / 최소 20자",
                                      size: SubpingFontSize.body5,
                                      fontWeight: SubpingFontWeight.regular,
                                    ),
                                  ],
                                ),
                                Space(size: SubpingSize.large15),
                                SubpingTextField(
                                  onTap: () {},
                                  focusNode: reviewViewModel.reviewFocusNode,
                                  onChanged:
                                      reviewViewModel.onChangeReviewContent,
                                  hintText: "서비스와 상품에 대한 소감을 말해주세요!",
                                  maxLines: 8,
                                ),
                                Space(size: SubpingSize.large15),
                                SquareButton(
                                    text: "리뷰 쓰기",
                                    onPressed: () async {
                                      await reviewViewModel.onSubmitReview(
                                          serviceId: serviceId);
                                    }),
                                Space(size: SubpingSize.large40),
                              ],
                            ),
                          ],
                        ),
                      )),
              ))),
    );
  }
}
