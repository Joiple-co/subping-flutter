import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/main_tabs/my_page/user_history_container.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'user_info_container.dart';
import 'my_page_service_list_container.dart';

class MyPage extends StatelessWidget {
  const MyPage() : super();


  Widget build(BuildContext context) {

    final userViewModel = Get.find<UserViewModel>();
    
    userViewModel.updateInfo();
    
    return HeaderSafe(
        hasBottomSafe: false,
        child: Scaffold(
            appBar: TitleAppBar("마이 페이지"),
            body: ListView(children: <Widget>[
              Container(
                child: Column(children: [
                  Space(size: SubpingSize.large30),
                  Container(
                    margin: EdgeInsets.fromLTRB(30.w, 0.0, 30.w, 30.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: SubpingColor.white100,
                        boxShadow: [
                          BoxShadow(
                              color: SubpingColor.black30,
                              offset: Offset(0.w, 0.h),
                              blurRadius: 20)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: 139.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(40.w, 30.h, 40.w, 30.h),
                          child: UserInfoContainer(userData: userViewModel),
                        ),
                        Container(
                          height: 167.h,
                          padding: EdgeInsets.fromLTRB(40.w, 30.h, 40.w, 30.h),
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
              Expanded(child: MyPageServiceListContainer()),
              
            ])));
  }
}
