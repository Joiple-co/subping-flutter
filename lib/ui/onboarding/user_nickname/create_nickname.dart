import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subping/modules/design_system/setting_table.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:subping/viewmodel/local/onboarding/create_nickname_viewmodel.dart';

class CreateNickName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNickNameController = Get.find<CreateNickNameViewModel>();

    return Obx(
      () => Scaffold(
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
                              text: "아직 ",
                              fontSize: SubpingFontSize.title4,
                              fontWeight: SubpingFontWeight.bold),
                          SubpingTextSpan(
                              text: "닉네임",
                              fontSize: SubpingFontSize.title4,
                              fontWeight: SubpingFontWeight.bold,
                              color: SubpingColor.subping100),
                          SubpingTextSpan(
                              text: "이 없어요!\n닉네임을 설정해주세요",
                              fontSize: SubpingFontSize.title4,
                              fontWeight: SubpingFontWeight.bold),
                          SubpingTextSpan(
                            text: "\n닉네임은 다른 사용자에게 공개됩니다 :)",
                            fontSize: SubpingFontSize.body1,
                          )
                        ])),
                        Space(size: SubpingSize.large32),
                        SubpingTextField(
                          labelText: "닉네임",
                          onChanged: userNickNameController.onChangedNickName,
                          focusNode: userNickNameController.inputFocusNode,
                          helperText: "닉네임은 한국어, 영문, 숫자로 4자리 이상 입력헤주세요.",
                          errorText:
                              userNickNameController.nickNameError.value != ""
                                  ? userNickNameController.nickNameError.value
                                  : null,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[ㄱ-ㅎ 가-힣 a-z A-Z 0-9]')),
                            FilteringTextInputFormatter.deny(" ")
                          ],
                        ),
                      ],
                    ),
                  ),
                  SquareButton(
                      text: "다음",
                      onPressed: userNickNameController.onButtonPress,
                      loading: userNickNameController.loading.value,
                      disabled: !userNickNameController.nickNameVaild.value),
                  Space(size: SubpingSize.large20)
                ],
              ),
            ),
          ))),
    );
  }
}
