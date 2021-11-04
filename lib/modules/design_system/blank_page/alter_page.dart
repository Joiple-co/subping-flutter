import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/space/space.dart';
import 'package:subping/modules/design_system/text/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../setting_table.dart';

class AlterPage extends StatelessWidget {
  final bool condition;
  final Map<String, dynamic> blankType;
  final Widget child;

  const AlterPage({this.blankType, this.condition, this.child, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!condition) {
      return child;
    } else {
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              blankType["resource"],
              width: 133.w,
              height: 160.h,
            ),
            Space(
              size: SubpingSize.large40,
            ),
            SubpingText(
              blankType["shortPhrases"],
              size: SubpingFontSize.body1,
            )
          ],
        ),
      );
    }
  }
}
