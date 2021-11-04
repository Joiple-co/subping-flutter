import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/main_tabs_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

class Expected extends StatelessWidget {
  const Expected({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeViewModel = Get.find<SubscribeViewModel>();
    final mainTabsViewModel = Get.find<MainTabsViewModel>();
    final subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

    return HorizontalPadding(
      child: GestureDetector(
        onTap: () {
          mainTabsViewModel.onChangeTabIndex(2);
          subscribeManageViewModel.changeTab(0);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 80.w,
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    SubpingColor.subping50,
                    SubpingColor.subping100
                  ]),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: SubpingColor.black60,
                        offset: Offset(0, 4.h),
                        blurRadius: 15)
                  ]),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubpingText("구독중인 상품의 총액",
                              color: SubpingColor.white100,
                              fontWeight: SubpingFontWeight.regular,
                              size: SubpingFontSize.body1),
                          Space(size: SubpingSize.tiny5),
                          Obx(
                            () => SubpingText(
                              Helper.setComma(subscribeViewModel.totalPrice) +
                                  " 원",
                              fontWeight: FontWeight.bold,
                              size: SubpingFontSize.title1,
                              color: SubpingColor.white100,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/icon/middleRightArrow.png',
                              height: 40.h,
                              width: 40.w,
                            ),
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
