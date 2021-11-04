import 'package:flutter/material.dart';

class HorizontalPadding extends StatelessWidget {
  final Widget child;

  const HorizontalPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: child,
    );
  }
}
