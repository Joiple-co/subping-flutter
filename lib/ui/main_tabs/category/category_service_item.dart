import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/design_system/settingTable.dart';
import 'package:subping/ui/design_system/subping_ui.dart';

class CategoryServiceItem extends StatelessWidget {
  final Map items;

  const CategoryServiceItem({this.items}) : super();

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.h),
            child: Image.network(
              "https://subping-assets.s3.ap-northeast-2.amazonaws.com/serviceLogo/watcha.png", 
              fit: BoxFit.fill,
              height: 360.h,
              width: 360.w,)),
          Space(size: SubpingSize.medium20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SubpingText("왓챠플레이", size: SubpingFontSize.body5, color: SubpingColor.black60),
            SubpingText("영화, 드라마 정주행백 편 신작 업데이트", size: SubpingFontSize.body2, maxLines: 2,)
          ],)
        ],
      ),
    );
  }
}
