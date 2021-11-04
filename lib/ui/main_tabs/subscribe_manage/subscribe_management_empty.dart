import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_payment_info.dart';

class SubscribeManagementEmpty extends StatelessWidget {
  const SubscribeManagementEmpty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 10,
        color: SubpingColor.back20,
      ),
      const SubscribePaymentInfo(
        paidPrice: 0,
        totalPrice: 0,
      ),
      Container(
        height: 10,
        color: SubpingColor.back20,
      ),
    ]);
  }
}
