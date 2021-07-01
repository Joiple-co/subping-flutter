import 'package:flutter/material.dart';
import '../settingTable.dart';

class Space extends StatelessWidget {
  final Size size;

  const Space({@required this.size, Key key}) : super(key: key);

  static Map<Size, Map> table = {
    Size.large: {"width": 64, "height": 64},
    Size.regular: {"width": 50, "height": 50},
    Size.small: {"width": 40, "height": 40},
    Size.tiny: {"width": 30, "height": 30},
    Size.xTiny: {"width": 24, "height": 24},
  };

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: table[this.size]["width"],
      height: table[this.size]["height"],
    ));
  }
}
