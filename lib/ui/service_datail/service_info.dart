import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ServiceInfo extends StatelessWidget {
  const ServiceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(size: SubpingSize.large20,),
          HorizontalPadding(
              child: SubpingText(
            "제품 상세",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          ))
        ],
      ),
    );
  }
}
