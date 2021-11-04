import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPadding extends StatelessWidget {
  final Widget child;

  const HeaderPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 64.h, 0, 0),
      child: child,
    );
  }
}
