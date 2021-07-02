
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class UserLoginViewModel extends GetxController{
  RxMap<String, String> currentTitle = {
    "preTitle": "로그인을 위해\n",
    "accent": "계정정보",
    "postTitle": "를 입력해주세요"
  }.obs;
  
  RxBool emailValid = false.obs;
  RxBool passwordValid = false.obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  void onInit() {
    super.onInit();
  }

  void onPressNext() async {
    Cognito cognito = Cognito();
    cognito.signIn(email.value, password.value);
  }

  void onChangeEmail(String newEmail) {
    email.value = newEmail;
  }

  void onChangePassword(String newPassword) {
    password.value = newPassword;
  }

  void onPressEmailDone(String _) {
    passwordFocus.requestFocus();
  }

  void onPressPasswordDone(String _) {

  }

  void onPressPasswordCheckDone(String _) {
    onPressNext();
  }
}