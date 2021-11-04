import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/subscribe_block_item_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'subscribe_block_item.dart';

class SubscribeBlock extends StatelessWidget {
  final List<SubScribeBlockItemModel> subscribeDataOfDay;

  const SubscribeBlock({this.subscribeDataOfDay, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h, top: 10.h),
      padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: SubpingColor.white100,
      ),
      child: Column(
        children: List.generate(subscribeDataOfDay.length, (index) {
          bool hasborder = true;
          if (index == 0) hasborder = false;
          return SubscribeBlockItem(
              hasborder: hasborder, subscribeData: subscribeDataOfDay[index]);
        }),
      ),
    );
  }
}
