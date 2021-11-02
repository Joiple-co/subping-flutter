import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_list.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_payment_info.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewModel.dart';

class SubscribeManagement extends StatelessWidget {
  const SubscribeManagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

    return Obx(() {
      final paidAndTotalPriceOfThisMonth =
          subscribeManageViewModel.paidAndTotalPriceOfThisMonth;

      return Container(
          color: SubpingColor.white100,
          child: ListView(
            children: [
              Container(
                height: 10,
                color: SubpingColor.back20,
              ),
              SubscribePaymentInfo(
                totalPrice: paidAndTotalPriceOfThisMonth['total'],
                paidPrice: paidAndTotalPriceOfThisMonth['paid'],
              ),
              Container(
                height: 10,
                color: SubpingColor.back20,
              ),
              SubscribeList()
            ],
          ));
    });
  }
}
