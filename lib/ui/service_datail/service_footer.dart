import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ServiceFooter extends StatelessWidget {
  final String serviceId;
  final bool userLike;
  final Function toggleUserLike;
  final List<ProductModel> products;

  const ServiceFooter(
      {Key key, this.serviceId, this.userLike, this.toggleUserLike, this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: toggleUserLike,
            child: userLike
                ? Container(
                    width: 110.w,
                    height: 110.w,
                    color: SubpingColor.back20,
                    child: Icon(Icons.favorite, color: SubpingColor.warning100),
                  )
                : Container(
                    width: 110.w,
                    height: 110.w,
                    color: SubpingColor.back20,
                    child: Icon(Icons.favorite, color: SubpingColor.black60),
                  ),
          ),
          Space(
            size: SubpingSize.tiny5,
          ),
          SquareButton(
            text: "구독하기",
            width: 680.w,
            height: 110.h,
            disabled: products.length == 0,
            onPressed: () => Get.toNamed("/startSubscribe/${serviceId}"),
          ),
        ]),
        Space(size: SubpingSize.tiny6)
      ]),
    );
  }
}
