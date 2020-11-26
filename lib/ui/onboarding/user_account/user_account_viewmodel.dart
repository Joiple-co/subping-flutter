import 'package:flutter/material.dart';
import 'package:subping/enum/enum.dart';

class UserAccountViewModel with ChangeNotifier {
  final stepWords = {
    OnboardingStep.ONBOARDING_EMAIL: "이메일 주소",
    OnboardingStep.ONBOARDING_PASSWORD: "비밀번호"
  };

  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPasswordFocusNode;

  String email;
  String password;
  String confirmPassword;

  OnboardingStep step;

  UserAccountViewModel() {
    email = "";
    password = "";
    confirmPassword = "";
    step = OnboardingStep.ONBOARDING_EMAIL;

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  void onChangeEmail(String text) {}

  void onChangePassword(String text) {}

  void onChangeConfirmPassword(String text) {}

  void onPressComplete() {
    if (step == OnboardingStep.ONBOARDING_EMAIL) {
      step = OnboardingStep.ONBOARDING_PASSWORD;
      notifyListeners();
    } else {}
  }
}
