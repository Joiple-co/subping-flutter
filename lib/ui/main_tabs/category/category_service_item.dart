import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/ui/design_system/settingTable.dart';
import 'package:subping/ui/design_system/subping_ui.dart';

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
              item.serviceSquareLogoUrl, 
              fit: BoxFit.fill,
              height: 360.h,
              width: 360.w,)),
          Space(size: SubpingSize.medium20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SubpingText(item.serviceName, size: SubpingFontSize.body5, color: SubpingColor.black60),
            SubpingText(item.serviceSummary, size: SubpingFontSize.body2, maxLines: 2,)
          ],)
        ],
      ),
    );
  }
}
