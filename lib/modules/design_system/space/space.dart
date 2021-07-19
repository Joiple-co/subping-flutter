import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../settingTable.dart';

class Space extends StatelessWidget {
  final double size;

  const Space({@required this.size, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: this.size.w,
      height: this.size.h,
    ));
  }
}
