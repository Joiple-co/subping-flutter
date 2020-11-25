import 'package:flutter/material.dart';

class HeaderSafe extends StatelessWidget {
  final Widget child;

  HeaderSafe({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          child: child,
          padding: EdgeInsets.only(bottom: 34),
        ),
      ),
    );
  }
}
