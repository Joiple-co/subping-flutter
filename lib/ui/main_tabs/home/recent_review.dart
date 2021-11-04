import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

// ignore: must_be_immutable
class RecentReview extends StatelessWidget {
  String reviewPK;
  String servicePK;
  String serviceName;
  num reviewRating;
  String reviewPrimaryImageUrl;
  String reviewContent;

  RecentReview({Key key}) : super(key: key) {
    reviewPK = "";
    servicePK = "";
    serviceName = "넷플릭스";
    reviewRating = 4.5;
    reviewContent =
        "정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!정말 졸아요!";
    reviewPrimaryImageUrl =
        "https://media-exp1.licdn.com/dms/image/C4E0BAQEVb0ZISWk8vQ/company-logo_200_200/0/1519896425167?e=2159024400&v=beta&t=mtbBYcyzfcDB7Seolq93YaKMruv36fIUCYMcI9g5itk";
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SubpingText(
              "섭퍼님들의 리뷰 😀",
              size: SubpingFontSize.title6,
              fontWeight: SubpingFontWeight.bold,
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: () => Get.toNamed("/hotChart"),
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
          ]),
          Space(size: SubpingSize.large24),
          Column(
            children: List.generate(3, (index) {
              return Column(children: [
                Row(
                  children: [
                    Container(
                      width: 210.h,
                      height: 210.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(reviewPrimaryImageUrl)),
                      ),
                    ),
                    Space(
                      size: SubpingSize.medium10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubpingText(serviceName,
                                  size: SubpingFontSize.body1),
                              RatingBar.builder(
                                  updateOnDrag: false,
                                  ignoreGestures: true,
                                  initialRating: reviewRating,
                                  itemSize: 50.h,
                                  glow: false,
                                  allowHalfRating: true,
                                  itemBuilder: (context, _) => Icon(Icons.star,
                                      color: SubpingColor.subping100),
                                  onRatingUpdate: (rating) {})
                            ],
                          ),
                          Space(size: SubpingSize.tiny5),
                          Container(height: 2, color: SubpingColor.black30),
                          Space(size: SubpingSize.tiny5),
                          SubpingText(
                            reviewContent,
                            size: SubpingFontSize.body3,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Space(size: SubpingSize.large40)
              ]);
            }),
          )
        ],
      ),
    );
  }
}
