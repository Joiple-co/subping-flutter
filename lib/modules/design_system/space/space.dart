import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double size;
  final Color color;

  const Space({@required this.size, this.color, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      color: this.color,
      width: this.size,
      height: this.size,
    ));
  }
}
