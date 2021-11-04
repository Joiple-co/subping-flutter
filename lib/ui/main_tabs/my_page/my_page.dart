import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/tool_bar/tool_bar.dart';
import 'package:subping/ui/main_tabs/my_page/user_history_container.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'user_info_container.dart';
import 'my_page_service_list_container.dart';

class MyPage extends StatelessWidget {
  const MyPage() : super();
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();

    return HeaderSafe(
        hasBottomSafe: false,
        child: Scaffold(
            appBar: TitleAppBar("마이 페이지",
                rear: Container(
                    child: ToolBar(hasAlarmIcon: true),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: SubpingColor.black30,
                          offset: Offset(0.w, 0.h),
                          blurRadius: 14)
                    ]))),
            body: ListView(children: <Widget>[
              Container(
                child: Column(children: [
                  Space(size: SubpingSize.large15),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0.0, 15, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: SubpingColor.white100,
                        boxShadow: [
                          BoxShadow(
                              color: SubpingColor.black30,
                              offset: Offset(0, 0),
                              blurRadius: 20)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: UserInfoContainer(userData: userViewModel),
                        ),
                        Container(
                          height: 80,
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: UserHistoryContainer(),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Container(
                child: Divider(
                  color: SubpingColor.back20,
                  thickness: 20.h,
                ),
              ),
              MyPageServiceListContainer(),
            ])));
  }
}
