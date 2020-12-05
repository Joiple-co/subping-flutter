import 'package:flutter/material.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/modules/secure/secure.dart';

class UserLoginViewModel with ChangeNotifier {
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;

  String email;
  String password;
  String emailErrorMessage;
  String passwordErrorMessage;
  bool isLoading;

  UserLoginViewModel() {
    email = "";
    password = "";
    isLoading = false;

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  void onChangeEmail(String text) {
    email = text;
    emailErrorMessage = null;
    notifyListeners();
  }

  void onChangePassword(String text) {
    password = text;
    passwordErrorMessage = null;
    notifyListeners();
  }

  void onSubmittedEmail() {
    passwordFocusNode.requestFocus();
  }

  void onPressLogin(BuildContext context) async {
    try {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      bool passwordValid =
          RegExp(r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
              .hasMatch(password);

      if (emailValid && passwordValid) {
        final secure = Secure();
        await secure.saveEmailPassword(email, password);

        final cognito = Cognito();
        final isLoginSuccess = await cognito.login(email, password);

        if (isLoginSuccess) {
          print("loggedIn");
        } else {
          ErrorHandler.errorHandler(context, "LoginException");
        }
      } else {
        if (!emailValid) {
          emailErrorMessage = "이메일 주소를 양식에 맞게 입력해주세요.";
          notifyListeners();
        }

        if (!passwordValid) {
          passwordErrorMessage = "비밀번호는 소문자, 숫자, 특수문자를 포함한\n8자리 이상으로 입력해야 합니다.";
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler(context, "default");
    }
  }
}
