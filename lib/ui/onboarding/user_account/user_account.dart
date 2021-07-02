import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/design_system/text/text.dart';
import 'package:subping/ui/onboarding/user_account/user_account_viewmodel.dart';

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
              Text.rich(SubpingTextSpan(children: [
                SubpingTextSpan(text: viewModel.currentTitle['preTitle'] + '\n', fontSize: SubpingFontSize.title4, fontWeight: SubpingFontWeight.bold),
                SubpingTextSpan(text: viewModel.currentTitle['accent'], fontSize: SubpingFontSize.title4, fontWeight: SubpingFontWeight.bold, color: SubpingColor.subping100),
                SubpingTextSpan(text: viewModel.currentTitle['postTitle'], fontSize: SubpingFontSize.title4, fontWeight: SubpingFontWeight.bold),
              ])),
              Space(size: Size.large64),
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
                  ),
                  Space(size: Size.large30),
                  SubpingTextField(
                    labelText: "비밀번호",
                    focusNode: viewModel.passwordFocus,
                    onChanged: viewModel.onChangePassword,
                    onSubmitted: viewModel.onPressPasswordDone,
                    errorText: viewModel.passwordError.value != ""
                        ? viewModel.passwordError.value
                        : null,
                    obscureText: true,
                  ),
                  Space(size: Size.large30),
                  SubpingTextField(
                    labelText: "비밀번호 확인",
                    focusNode: viewModel.passwordCheckFocus,
                    onChanged: viewModel.onChangePasswordCheck,
                    onSubmitted: viewModel.onPressPasswordCheckDone,
                    errorText: viewModel.passwordCheckError.value != ""
                        ? viewModel.passwordCheckError.value
                        : null,
                    obscureText: true,
                  )
                ],
              )),
              SqaureButton(
                  text: "다음",
                  onPressed: () => {},
                  disabled: !(viewModel.emailValid.value &&
                      viewModel.passwordValid.value &&
                      viewModel.passwordCheckValid.value)),
              Space(size: Size.large40)
            ])))));
  }
}
