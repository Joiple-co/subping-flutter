import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchIcon  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return 
      IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minHeight: 50.h,
            minWidth: 50.w,
          ),
          icon: Image.asset(
            "assets/icon/search.png",
          ),
          onPressed: () { 
            Get.toNamed("/search");  
          },
        );
  }
}