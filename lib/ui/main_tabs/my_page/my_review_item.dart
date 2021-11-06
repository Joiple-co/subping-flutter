import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/modules/design_system/setting_table.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/design_system/text/text.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewItem({Key key, this.reviewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String serviceName = "넷플릭스";
    return Column(
      children: [
        Material(
          child: InkWell(
              splashColor: Colors.white.withOpacity(0.3),
              onTap: () =>
                  {Get.toNamed("/serviceDetail/${reviewModel.serviceId}")},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://media-exp1.licdn.com/dms/image/C4E0BAQEVb0ZISWk8vQ/company-logo_200_200/0/1519896425167?e=2159024400&v=beta&t=mtbBYcyzfcDB7Seolq93YaKMruv36fIUCYMcI9g5itk",
                      height: 40,
                      width: 40,
                    ),
                    Space(size: SubpingSize.large20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubpingText(
                          serviceName,
                          color: SubpingColor.subping50,
                          size: SubpingFontSize.body4,
                          maxLines: 1,
                        ),
                        RatingBar.builder(
                          glow: false,
                          itemSize: 25,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          initialRating: reviewModel.rating.toDouble(),
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: SubpingColor.subping100),
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: const SubpingDivider(),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubpingText(
                reviewModel.content,
              ),
              Space(size: SubpingSize.large25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubpingText(DateFormat("yyyy.MM.dd")
                      .format(DateTime.parse(reviewModel.createdAt))),
                  GestureDetector(
                    child: SubpingText(
                      "수정하기",
                      color: SubpingColor.subping50,
                      size: SubpingFontSize.body4,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: SubpingDivider(color: SubpingColor.black60),
        ),
      ],
    );
  }
}
