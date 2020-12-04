import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/design_system/textfield/widthfit_textfield.dart';
import 'package:subping/ui/onboarding/user_login/user_login_viewmodel.dart';

class UserLogin extends StatelessWidget {
  final viewModelInstance = UserLoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModelInstance,
        child: Builder(builder: (BuildContext context) {
          final viewModel = Provider.of<UserLoginViewModel>(context);

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
                          TextSpan(text: "로그인을 위해\n", children: [
                            TextSpan(
                                text: "아이디와 비밀번호",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 224, 197, 1))),
                            TextSpan(text: "를 입력해 주세요.")
                          ]),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              height: 1.3),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(children: [
                              SizedBox(height: 30),
                              WidthFitTextField(
                                labelText: "이메일",
                                focusNode: viewModel.emailFocusNode,
                                onChanged: viewModel.onChangeEmail,
                                errorText: viewModel.emailErrorMessage,
                                onSubmitted: (String _) =>
                                    viewModel.onSubmittedEmail(),
                              ),
                              SizedBox(height: 16),
                              WidthFitTextField(
                                  labelText: "비밀번호",
                                  focusNode: viewModel.passwordFocusNode,
                                  onChanged: viewModel.onChangePassword,
                                  errorText: viewModel.passwordErrorMessage,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false),
                            ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SqaureButton(
                              text: "로그인",
                              onPressed: () => viewModel.onPressLogin(context)),
                        )
                      ]),
                ),
              ));
        }));
  }
}
