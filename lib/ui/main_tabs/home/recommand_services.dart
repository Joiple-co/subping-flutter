import "package:flutter/material.dart";
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendServices extends StatelessWidget {
  List<ServiceModel> userRecommendServices;

  RecommendServices({this.userRecommendServices});

  List<Widget> generateServices(BuildContext context) {
    List<Widget> result = [];
    List<Widget> tempRow = [];

    for (var index = 0; index < this.userRecommendServices.length; index++) {
      tempRow.add(SizedBox(
        width: 153.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: Container(
                width: 153.w,
                height: 80.h,
                child: Image.network(
                    this.userRecommendServices[index].serviceSqaureLogoUrl,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8.h),
            Text(this.userRecommendServices[index].serviceName,
                style:
                    TextStyle(fontSize: 18.nsp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text(this.userRecommendServices[index].servicSummary,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12.nsp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 134, 135, 1))),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: "구독", children: [
                    TextSpan(
                        text:
                            " ${Helper().setComma(this.userRecommendServices[index].serviceMinPrice)}원 ~",
                        style:
                            TextStyle(color: Color.fromRGBO(156, 156, 156, 1)))
                  ]),
                  style: TextStyle(
                    color: Color.fromRGBO(0, 224, 197, 1),
                    fontSize: 10.nsp,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded,
                        color: Theme.of(context).primaryColor, size: 10.nsp),
                    Text(
                      " " +
                          this
                              .userRecommendServices[index]
                              .serviceRating
                              .toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(191, 191, 191, 1),
                        fontSize: 10.nsp,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ));

      if (tempRow.length == 2) {
        result.add(Row(
            children: tempRow,
            mainAxisAlignment: MainAxisAlignment.spaceBetween));
        result.add(SizedBox(height: 10.h));
        tempRow = [];
      }

      if (result.length == 8) {
        return result;
      }
    }

    if (tempRow.length != 0) {
      result.add(Row(
          children: tempRow,
          mainAxisAlignment: MainAxisAlignment.spaceBetween));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HorizontalPadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "승우", children: [
                  TextSpan(
                      text: "님이 좋아할 구독상품",
                      style: TextStyle(color: Colors.black))
                ]),
                style: TextStyle(
                    color: Color.fromRGBO(0, 224, 197, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.nsp,
                    height: 1.3.h),
              ),
              Text("더보기", style: TextStyle(fontSize: 12.nsp))
            ],
          ),
        ),
        SizedBox(height: 16.h),
        HorizontalPadding(
          child: Column(
            children: this.generateServices(context),
          ),
        ),
      ],
    ));
  }
}
