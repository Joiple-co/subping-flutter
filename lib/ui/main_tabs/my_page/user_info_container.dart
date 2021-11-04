import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class UserInfoContainer extends StatelessWidget {
  final UserViewModel userData;

  const UserInfoContainer({this.userData, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        GestureDetector(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: Image.network(
              userData.userProfileImageUrl,
              width: 40,
              height: 40,
            ).image,
          ),
        ),
        Space(
          size: SubpingSize.medium10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubpingText("${userData.name}님 / ${userData.nickName}",
                fontWeight: FontWeight.bold, size: SubpingFontSize.body2),
            SubpingText(
              userData.email,
              color: SubpingColor.black60,
              size: SubpingFontSize.tiny1,
            )
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/icon/black_middleRightArrow.png',
              height: 20,
              width: 20,
            ),
          ),
        )
      ]),
    );
  }
}
