import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/onboarding/user_login_viewmodel.dart';

class UserLogin extends StatelessWidget {
  const UserLogin() : super();

  @override
  Widget build(BuildContext context) {
    Get.put(UserLoginViewModel());

    return GetX<UserLoginViewModel>(
      builder: (viewModel) => Scaffold(
        body: HeaderSafe(
          child: HorizontalPadding(
            child: HeaderPadding(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(SubpingTextSpan(children: [
                  SubpingTextSpan(
                      text: viewModel.currentTitle['preTitle'],
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
                    ),
                    Space(size: SubpingSize.large15),
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
                  ],
                )),
                SquareButton(
                    text: "확인",
                    onPressed: viewModel.onPressNext,
                    disabled: !(viewModel.emailValid.value &&
                        viewModel.passwordValid.value),
                    loading: viewModel.loading.value),
                Space(size: SubpingSize.large20)
              ],
            )),
          ),
        ),
      ),
    );
  }
}
