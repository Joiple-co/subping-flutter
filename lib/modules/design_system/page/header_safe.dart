import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSafe extends StatelessWidget {
  final Widget child;
  final bool hasBottomSafe;

  const HeaderSafe({Key key, this.child, this.hasBottomSafe = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          child: child,
          padding: EdgeInsets.only(bottom: hasBottomSafe ? 34.h : 0),
        ),
      ),
    );
  }
}
