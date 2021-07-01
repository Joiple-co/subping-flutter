import 'package:flutter/material.dart';
import '../settingTable.dart';

class Space extends StatelessWidget {
  final Size size;

  const Space({@required this.size, Key key}) : super(key: key);

  static Map<Size, Map> table = {
    Size.large64: {"width": 64, "height": 64},
    Size.large50: {"width": 50, "height": 50},
    Size.large48: {"width": 48, "height": 48},
    Size.large40: {"width": 40, "height": 40},
    Size.large30: {"width": 30, "height": 30},
    Size.medium24: {"width": 24, "height": 24},
    Size.medium20: {"width": 20, "height": 20},
    Size.medium16: {"width": 16, "height": 16},
    Size.tiny14: {"width": 14, "height": 14},
    Size.tiny12: {"width": 12, "height": 12},
    Size.tiny10: {"width": 10, "height": 10},
  };

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: table[this.size]["width"],
      height: table[this.size]["height"],
    ));
  }
}
