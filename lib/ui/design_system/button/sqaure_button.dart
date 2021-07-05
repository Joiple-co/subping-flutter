import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SqaureButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double width;
  final double height;
  final bool disabled;
  final bool loading;

  SqaureButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.width,
      this.height = 110,
      this.loading = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double indicatorSize = height.h - height.h / 2;

    return FlatButton(
      child: loading
          ? Container(
              height: indicatorSize,
              width: indicatorSize,
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).indicatorColor),
              ),
            )
          : Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34.nsp)),
      onPressed: disabled || loading ? null : onPressed,
      minWidth: width != null ? width : MediaQuery.of(context).size.width - 40,
      height: height.h,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Theme.of(context).disabledColor,
    );
  }
}
