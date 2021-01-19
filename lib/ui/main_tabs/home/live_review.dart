import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';

class LiveReview extends StatelessWidget {
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
                TextSpan(text: "유저", children: [
                  TextSpan(
                      text: "들의 구독상품 후기", style: TextStyle(color: Colors.black))
                ]),
                style: TextStyle(
                    color: Color.fromRGBO(0, 224, 197, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.nsp,
                    height: 1.3.h),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    ));
  }
}
