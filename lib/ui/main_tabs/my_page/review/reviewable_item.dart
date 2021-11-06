import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/design_system/snackBar/snack_bar.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ReviewableItem extends StatelessWidget {
  final Function makeReview;
  final Function showSnackBar;
  final SubscribeModel subscribeModel;

  const ReviewableItem(
      {Key key, this.subscribeModel, this.makeReview, this.showSnackBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        children: [
          Image.network(
            "https://media-exp1.licdn.com/dms/image/C4E0BAQEVb0ZISWk8vQ/company-logo_200_200/0/1519896425167?e=2159024400&v=beta&t=mtbBYcyzfcDB7Seolq93YaKMruv36fIUCYMcI9g5itk",
            height: 40,
            width: 40,
          ),
          Space(size: SubpingSize.large20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubpingText("네이쳐스 기타 등등"),
              RatingBar.builder(
                itemSize: 25,
                initialRating: 0,
                tapOnlyMode: true,
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: SubpingColor.subping100),
                onRatingUpdate: (double value) {
                  // makeReview(value, subscribeModel.serviceId);
                  SubpingSnackBar.showSnackBar(
                      context,
                      Row(
                        children: [
                          Icon(Icons.star, color: SubpingColor.subping100),
                          Space(
                            size: SubpingSize.large20,
                          ),
                          SubpingText(
                            "별점 등록 완료",
                            fontWeight: SubpingFontWeight.bold,
                          )
                        ],
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
