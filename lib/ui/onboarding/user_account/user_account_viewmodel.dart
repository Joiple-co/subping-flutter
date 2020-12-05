import 'package:flutter/material.dart';
import 'package:subping/enum/enum.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class UserAccountViewModel with ChangeNotifier {
  final stepWords = {
    OnboardingStep.ONBOARDING_EMAIL: "이메일 주소",
    OnboardingStep.ONBOARDING_PASSWORD: "비밀번호"
  };

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;

  String email;
  String password;
  String emailErrorMessage;
  String passwordErrorMessage;
  bool isLoading;
  bool emailConfirmed;

  OnboardingStep step;

  UserAccountViewModel() {
    email = "";
    emailErrorMessage = null;
    password = "";
    passwordErrorMessage = null;
    step = OnboardingStep.ONBOARDING_EMAIL;
    isLoading = false;
    emailConfirmed = false;

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

  void onPressCompleteEmail(BuildContext context) async {
    try {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      if (emailValid) {
        isLoading = true;
        notifyListeners();

        final cognito = Cognito();
        final response = await cognito.emailDuplicate(email);

        isLoading = false;
        notifyListeners();

        if (response.success) {
          step = OnboardingStep.ONBOARDING_PASSWORD;
          notifyListeners();

          passwordFocusNode.requestFocus();
        } else {
          if (response.message == "emailExistException") {
            emailErrorMessage = "이미 사용중인 이메일 입니다.";
            notifyListeners();
          }
        }
      } else {
        emailErrorMessage = "이메일 주소를 양식에 맞게 입력해주세요.";
        notifyListeners();
      }
    } catch (e) {
      ErrorHandler.errorHandler(context, "ApiRequestException");
    }
  }

  void onPressCompletePassword(BuildContext context) async {
    try {
      bool passwordValid =
          RegExp(r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
              .hasMatch(password);

      if (passwordValid) {
        isLoading = true;
        notifyListeners();

        final cognito = Cognito();
        final response = await cognito.signUpStart(email, password);

        isLoading = false;
        notifyListeners();

        if (response.success) {
          Navigator.pushNamed(context, "/passAuth");
        } else {
          ErrorHandler.errorHandler(context, response.message);
        }
      } else {
        passwordErrorMessage = "비밀번호를 양식에 맞게 입력해주세요.";
        notifyListeners();
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler(context, "default");
    }
  }

  void onSubmittedEmail(BuildContext context) {
    onPressCompleteEmail(context);
  }

  bool buttonDisabled() {
    if (step == OnboardingStep.ONBOARDING_EMAIL) {
      return email.length == 0;
    } else {
      return password.length == 0 && email.length == 0;
    }
  }
}
