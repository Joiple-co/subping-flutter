import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/subscribe_block_item_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class SubscribeBlockItem extends StatelessWidget {
  bool hasborder;
  SubScribeBlockItemModel subscribeData;
  SubscribeBlockItem({this.hasborder, this.subscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: hasborder
            ? Border(
                top: BorderSide(width: 2, color: SubpingColor.black30),
              )
            : null,
      ),
      padding: EdgeInsets.fromLTRB(0, 30.h, 0, 30.h),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://pds.joins.com/news/component/htmlphoto_mmdata/202107/06/21ce34aa-c1e6-4b62-a5d5-568fe81334c4.jpg")),
            ),
          ),
          Space(size: SubpingSize.medium10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SubpingText(
                    "구매상품",
                    size: SubpingFontSize.tiny1,
                    fontWeight: SubpingFontWeight.medium,
                  ),
                  Space(size: SubpingSize.tiny5),
                  SubpingText(
                    "구매 서비스",
                    size: SubpingFontSize.tiny1,
                    color: SubpingColor.black60,
                  )
                ],
              ),
              SubpingText(
                "9,900원 결제 예정",
                size: SubpingFontSize.body2,
                fontWeight: FontWeight.bold,
              )
            ],
          )
        ],
      ),
    );
  }
}
