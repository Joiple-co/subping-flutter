import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/setting_table.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/user_nickname_viewmodel.dart';

class UserNickName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNickNameController = Get.put(UserNickNameViewModel());
    return Scaffold(
        backgroundColor: SubpingColor.white100,
        body: HeaderSafe(
            child: HorizontalPadding(
          child: HeaderPadding(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(SubpingTextSpan(children: [
                        SubpingTextSpan(
                            text: "사용하실 ",
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold),
                        SubpingTextSpan(
                            text: "닉네임",
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold,
                            color: SubpingColor.subping100),
                        SubpingTextSpan(
                            text: "을 입력해주세요!",
                            fontSize: SubpingFontSize.title4,
                            fontWeight: SubpingFontWeight.bold),
                      ])),
                      Space(size: SubpingSize.large32),
                      SubpingTextField(
                        labelText: "닉네임",
                        onChanged: userNickNameController.onChangedNickName,
                        focusNode: userNickNameController.inputFocusNode,
                      ),
                    ],
                  ),
                ),
                SquareButton(
                    text: "다음",
                    onPressed: userNickNameController.onButtonPress,
                    disabled: userNickNameController.nickNameError.value &&
                        !userNickNameController.nickNameVaild.value),
                Space(size: SubpingSize.large20)
              ],
            ),
          ),
        )));
  }
}

// Lottie.asset('assets/lottie/ok.json',
//     width: MediaQuery.of(context).size.width * 0.8,
//     fit: BoxFit.fill,
//     repeat: false),
// Space(
//   size: SubpingSize.large15,
// ),
// SubpingText(
//   "닉네임 등록 완료!",
//   size: SubpingFontSize.title3,
//   fontWeight: SubpingFontWeight.bold,
// ),
// SquareButton(text: "qwdp", onPressed: () {})
