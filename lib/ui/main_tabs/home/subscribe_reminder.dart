import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';

class SubscribeReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalPadding(
            child: Row(
              children: [
                Icon(FontAwesome.calendar,
                    size: 26, color: Theme.of(context).primaryColor),
                SizedBox(
                  width: 10,
                ),
                Text("구독 알리미",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                Expanded(child: Container()),
                Text("더보기")
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Text("결제",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HorizontalPadding(
                        child: Text("3일 뒤 유튜브 프리미엄 외 1개가\n결제될 예정입니다.",
                            style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HorizontalPadding(
                        child: Text("걸제 예정 금액 : 10,000원",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 3,
              loop: true,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          )
        ],
      ),
    );
  }
}
