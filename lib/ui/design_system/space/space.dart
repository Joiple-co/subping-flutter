import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../settingTable.dart';

class Space extends StatelessWidget {
  final SubpingSize size;

  const Space({@required this.size, Key key}) : super(key: key);

  static Map<SubpingSize, Map> table = {
    SubpingSize.large64: {"width": 64.w, "height": 64.h},
    SubpingSize.large50: {"width": 50.w, "height": 50.h},
    SubpingSize.large48: {"width": 48.w, "height": 48.h},
    SubpingSize.large40: {"width": 40.w, "height": 40.h},
    SubpingSize.large30: {"width": 30.w, "height": 30.h},
    SubpingSize.medium24: {"width": 24.w, "height": 24.h},
    SubpingSize.medium20: {"width": 20.w, "height": 20.h},
    SubpingSize.medium16: {"width": 16.w, "height": 16.h},
    SubpingSize.tiny14: {"width": 14.w, "height": 14.h},
    SubpingSize.tiny12: {"width": 12.w, "height": 12.h},
    SubpingSize.tiny10: {"width": 10.w, "height": 10.h},
  };

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: table[this.size]["width"],
      height: table[this.size]["height"],
    ));
  }
}
