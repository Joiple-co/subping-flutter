import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class UserLoginViewModel extends GetxController {
  RxMap<String, String> currentTitle =
      {"preTitle": "로그인을 위해\n", "accent": "계정정보", "postTitle": "를 입력해주세요"}.obs;

  RxBool loading = false.obs;
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

    debounce(email, (text) async {
      checkEmailVaild();
    }, time: Duration(milliseconds: 500));

    debounce(password, (text) {
      checkPasswordValid();
    }, time: Duration(milliseconds: 500));
  }

  Future<bool> checkEmailVaild() async {
    if (GetUtils.isEmail(email.value)) {
      emailValid.value = true;
      emailError.value = "";
      return true;
    } else {
      emailValid.value = false;
      emailError.value = email.value == "" ? "" : "이메일 주소를 양식에 맞게 입력헤주세요.";
    }

    return false;
  }

  bool checkPasswordValid() {
    bool passwordValidCheck =
        RegExp(r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
            .hasMatch(password.value);

    passwordError.value = "";
    passwordValid.value = false;

    if (passwordValidCheck) {
      passwordValid.value = true;
      passwordError.value = "";
    } else {
      passwordError.value = password.value == "" ? "" : "비밀번호를 양식에 맞게 입력해주세요.";
    }

    return false;
  }

  void onPressNext() async {
    try {
      loading.value = true;

      Cognito cognito = Cognito();

      final result = await cognito.signIn(email.value, password.value);
      final isSignedIn = await cognito.checkLoggedIn();

      loading.value = false;

      if (isSignedIn) {
        Get.offAllNamed("/mainTabs");
        print("logged in");
      } else {
        ErrorHandler.errorHandler("LoginException");
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("default");
    }
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
    onPressNext();
  }
}
