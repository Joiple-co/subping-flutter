import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 상단 인사 & 툴 버튼
          HorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "승우님",
                      style: TextStyle(
                          fontSize: 18.nsp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "상쾌한 월요일입니다 :)",
                      style: TextStyle(fontSize: 15.nsp),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(EvilIcons.search, size: 35.nsp),
                    SizedBox(width: 10.w),
                    Icon(EvilIcons.bell, size: 35.nsp),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 360.w,
            height: 200.h,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/bannerTest.png"),
                        height: 200.h,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 3,
              loop: true,
              autoplay: true,
              pagination: SwiperPagination(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Theme.of(context).disabledColor,
                      activeColor: Theme.of(context).primaryColor,
                      size: 5,
                      activeSize: 5)),
            ),
          )
        ],
      ),
    );
  }
}
