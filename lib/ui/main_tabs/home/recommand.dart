import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommand extends StatelessWidget {
  const Recommand({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SubpingColor.warning100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Swiper(
              itemCount: 3,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: SubpingColor.black60,
                      size: 20.w,
                      activeSize: 20.w)),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          "https://img4.daumcdn.net/thumb/R658x0.q70/?fname=http://t1.daumcdn.net/news/201707/22/MONSTERZYM/20170722043419774lrai.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
