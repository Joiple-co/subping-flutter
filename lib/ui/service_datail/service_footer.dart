import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ServiceFooter extends StatelessWidget {
  final String serviceId;
  final bool userLike;
  final Function toggleUserLike;
  final List<ProductModel> products;
  final Map<String, SubscribeModel> subscribes;

  const ServiceFooter(
      {Key key,
      this.serviceId,
      this.userLike,
      this.toggleUserLike,
      this.products,
      this.subscribes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasSubscribe = subscribes[serviceId] != null;

      return SafeArea(
        bottom: true,
        child: Column(children: [
          Space(size: SubpingSize.tiny5),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: toggleUserLike,
              child: userLike
                  ? Container(
                      width: 55,
                      height: 55,
                      color: SubpingColor.back20,
                      child:
                          Icon(Icons.favorite, color: SubpingColor.warning100),
                    )
                  : Container(
                      width: 55,
                      height: 55,
                      color: SubpingColor.back20,
                      child: Icon(Icons.favorite, color: SubpingColor.black60),
                    ),
            ),
            Space(
              size: SubpingSize.tiny5,
            ),
            hasSubscribe
                ? Row(
                    children: [
                      SquareButton(
                        text: "리뷰적기",
                        type: "outline",
                        width: 330.w,
                        onPressed: () =>
                            Get.toNamed("/startSubscribe/$serviceId"),
                      ),
                      Space(
                        size: SubpingSize.tiny5,
                      ),
                      SquareButton(
                        text: "관리하기",
                        width: 330.w,
                        onPressed: () =>
                            Get.toNamed("/startSubscribe/$serviceId"),
                      ),
                    ],
                  )
                : SquareButton(
                    text: "구독하기",
                    width: 680.w,
                    disabled: products.isEmpty,
                    onPressed: () => Get.toNamed("/startSubscribe/$serviceId"),
                  ),
          ]),
        ]),
      );
    });
  }
}
