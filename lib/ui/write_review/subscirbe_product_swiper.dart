import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';

class SubScribeProductSwiper extends StatelessWidget {
  final SubscribeModel subscribeModel;

  const SubScribeProductSwiper({Key key, this.subscribeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      height: 100,
      child: Swiper(
        loop: false,
        itemCount: subscribeModel.subscribeItems.length,
        pagination: subscribeModel.subscribeItems.length == 1
            ? null
            : SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: SubpingColor.black60, size: 20.w, activeSize: 20.w)),
        itemBuilder: (BuildContext context, int index) {
          final productItem = subscribeModel.subscribeItems[index].product;
          return GestureDetector(
            child: Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      productItem.productLogoUrl))),
                        ),
                        Space(
                          size: SubpingSize.large15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubpingText(
                                productItem.name,
                                size: SubpingFontSize.body1,
                              ),
                              SubpingText(
                                "${Helper.setComma(productItem.price)}원",
                                size: SubpingFontSize.body2,
                              ),
                              SubpingText(
                                productItem.summary,
                                size: SubpingFontSize.body2,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    ));
  }
}
