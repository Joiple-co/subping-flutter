import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ServiceFooter extends StatelessWidget {
  final bool userLike;
  final Function toggleUserLike;

  const ServiceFooter({ Key key, this.userLike, this.toggleUserLike }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: toggleUserLike,
              child: userLike ?
              Container(
                width: 110.w,
                height: 110.w,
                color: SubpingColor.back20,
                child: Icon(Icons.favorite, color: SubpingColor.warning100),) :
              Container(
                width: 110.w,
                height: 110.w,
                color: SubpingColor.back20,
                child: Icon(Icons.favorite, color: SubpingColor.black60),)
                ,
            ),
            Space(size: SubpingSize.tiny5,),
            SquareButton(text: "구독하기", width: 680.w, height: 110.h,),
          ]
        ),
        Space(size: SubpingSize.tiny6)
        ]
      ),
    );
  }
}