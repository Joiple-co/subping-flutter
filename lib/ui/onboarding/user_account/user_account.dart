import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/onboarding/user_account_viewmodel.dart';

class UserAccount extends StatelessWidget {
  const UserAccount() : super();

  @override
  Widget build(BuildContext context) {
    Get.put(UserAccountViewModel());

    return GetX<UserAccountViewModel>(
        builder: (viewModel) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: HeaderSafe(
                child: HorizontalPadding(
                    child: HeaderPadding(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  Text.rich(SubpingTextSpan(children: [
                    SubpingTextSpan(
                        text: viewModel.currentTitle['preTitle'] + '\n',
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold),
                    SubpingTextSpan(
                        text: viewModel.currentTitle['accent'],
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold,
                        color: SubpingColor.subping100),
                    SubpingTextSpan(
                        text: viewModel.currentTitle['postTitle'],
                        fontSize: SubpingFontSize.title4,
                        fontWeight: SubpingFontWeight.bold),
                  ])),
                  Space(size: SubpingSize.large32),
                  Expanded(
                      child: Column(
                    children: [
                      SubpingTextField(
                        labelText: "이메일",
                        focusNode: viewModel.emailFocus,
                        onChanged: viewModel.onChangeEmail,
                        onSubmitted: viewModel.onPressEmailDone,
                        errorText: viewModel.emailError.value != ""
                            ? viewModel.emailError.value
                            : null,
                        maxLines: 1,
                      ),
                      Space(size: SubpingSize.large15),
                      SubpingTextField(
                        labelText: "비밀번호",
                        helperText: "비밀번호는 8자리 이상의\n영문, 숫자, 특수문자의 조합으로 구성됩니다.",
                        focusNode: viewModel.passwordFocus,
                        onChanged: viewModel.onChangePassword,
                        onSubmitted: viewModel.onPressPasswordDone,
                        errorText: viewModel.passwordError.value != ""
                            ? viewModel.passwordError.value
                            : null,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      Space(size: SubpingSize.large15),
                      SubpingTextField(
                        labelText: "비밀번호 확인",
                        focusNode: viewModel.passwordCheckFocus,
                        onChanged: viewModel.onChangePasswordCheck,
                        onSubmitted: (viewModel.emailValid.value &&
                                viewModel.passwordValid.value &&
                                viewModel.passwordCheckValid.value)
                            ? viewModel.onPressPasswordCheckDone
                            : (String _) {},
                        errorText: viewModel.passwordCheckError.value != ""
                            ? viewModel.passwordCheckError.value
                            : null,
                        obscureText: true,
                        maxLines: 1,
                      )
                    ],
                  )),
                  SquareButton(
                      text: "다음",
                      onPressed: () => viewModel.onPressNext(),
                      loading: viewModel.loading.value,
                      disabled: !(viewModel.emailValid.value &&
                          viewModel.passwordValid.value &&
                          viewModel.passwordCheckValid.value)),
                  Space(size: SubpingSize.large20)
                ]))))));
  }
}
