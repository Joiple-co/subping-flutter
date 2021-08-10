import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class CategoryServiceItem extends StatelessWidget {
  final ServiceModel item;

  const CategoryServiceItem({this.item}) : super();

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.h),
            child: Image.network(
              item.serviceLogoUrl, 
              fit: BoxFit.fill,
              height: 360.h,
              width: 360.w,)),
          Space(size: SubpingSize.medium20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SubpingText(item.name, size: SubpingFontSize.body5, color: SubpingColor.black60),
            SubpingText(item.summary, size: SubpingFontSize.body2, maxLines: 2,)
          ],)
        ],
      ),
    );
  }
}
