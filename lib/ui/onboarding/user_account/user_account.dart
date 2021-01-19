import 'package:flutter/material.dart';
import 'package:subping/const/const.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/design_system/textfield/widthfit_textfield.dart';
import 'package:subping/ui/onboarding/user_account/user_account_viewmodel.dart';

class UserAccount extends StatelessWidget {
  final viewModelInstance = UserAccountViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModelInstance,
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<UserAccountViewModel>(context);

          return Scaffold(
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              body: HeaderSafe(
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Text.rich(
                        TextSpan(text: "회원가입을 위해\n", children: [
                          TextSpan(
                              text: viewModel.stepWords[viewModel.step],
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 224, 197, 1))),
                          TextSpan(text: "를 입력해 주세요.")
                        ]),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.nsp,
                            height: 1.3),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                SizedBox(height: 30.h),
                                WidthFitTextField(
                                  labelText: "이메일",
                                  errorText: viewModel.emailErrorMessage,
                                  focusNode: viewModel.emailFocusNode,
                                  onChanged: viewModel.onChangeEmail,
                                  onSubmitted: (String _) =>
                                      viewModel.onSubmittedEmail(context),
                                ),
                                SizedBox(height: 16.h),
                                AnimatedOpacity(
                                  opacity: viewModel.step == ONBOARDING_PASSWORD
                                      ? 1
                                      : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOutBack,
                                  child: WidthFitTextField(
                                      labelText: "비밀번호",
                                      helperText:
                                          "비밀번호는 영문, 숫자, 특수기호를 포함한\n8자리 이상으로 설정해야 합니다.",
                                      errorText: viewModel.passwordErrorMessage,
                                      focusNode: viewModel.passwordFocusNode,
                                      onChanged: viewModel.onChangePassword,
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false),
                                )
                              ],
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SqaureButton(
                          text: "다음",
                          onPressed: viewModel.step == ONBOARDING_EMAIL
                              ? () => viewModel.onPressCompleteEmail(context)
                              : () =>
                                  viewModel.onPressCompletePassword(context),
                          disabled: viewModel.buttonDisabled(),
                          loading: viewModel.isLoading,
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
