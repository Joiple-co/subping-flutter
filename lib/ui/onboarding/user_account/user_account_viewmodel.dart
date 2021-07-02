
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/cognito/cognito.dart';

class UserAccountViewModel extends GetxController{
  final itemArray = {
    "email": {
      "preTitle": "회원가입을 위해",
      "accent": "이메일",
      "postTitle": "을 입력해주세요"
    },
    "password": {
      "preTitle": "회원가입을 위해",
      "accent": "비밀번호",
      "postTitle": "를 입력해주세요"
    },
    "passwordCheck": {
      "preTitle": "정보확인을 위해",
      "accent": "비밀번호",
      "postTitle": "를 다시 입력해주세요"
    }
  };

  RxBool emailValid = false.obs;
  RxBool passwordValid = false.obs;
  RxBool passwordCheckValid = false.obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  RxString passwordCheckError = "".obs;
  RxString focusField = "email".obs;
  RxString email = "".obs;
  RxString password = "".obs;
  RxString passwordCheck = "".obs;
  RxMap<String, String> currentTitle;
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode passwordCheckFocus = FocusNode();
  
  void onInit() {
    super.onInit();

    currentTitle = itemArray[focusField].obs;

    emailFocus.requestFocus();

    emailFocus.addListener(() {
      if(emailFocus.hasFocus) {
        focusField.value = "email";
      }
    });

    passwordFocus.addListener(() {
      if(passwordFocus.hasFocus) {
        focusField.value = "password";
      }
    });

    passwordCheckFocus.addListener(() {
      if(passwordCheckFocus.hasFocus) {
        focusField.value = "passwordCheck";
      }
    });

    ever(focusField, (_) {
      currentTitle.value = itemArray[focusField];
    });

    debounce(email, (text) async {
      if(GetUtils.isEmail(text)) {
        Cognito cognito = Cognito();
        final duplicateEmailResponse = await cognito.isDuplicateEmail(text);
        print(duplicateEmailResponse.message);
        if(duplicateEmailResponse.message != "EmailExistException") {
          emailValid.value = true;
          emailError.value = "";
        }

        else {
          emailValid.value = false;
          emailError.value = "이미 사용중인 이메일입니다.";
        }
      }
      
      else {
        emailValid.value = false;
        emailError.value = "이메일 주소를 양식에 맞게 입력헤주세요.";
      }
    },
    time: Duration(milliseconds: 500));

    debounce(password, (text) {
      checkPasswordValid();
    },
    time: Duration(milliseconds: 500));

    debounce(passwordCheck, (text) {
      checkPasswordValid();
    },
    time: Duration(milliseconds: 500));
  }

  bool checkPasswordValid() {
      bool passwordValidCheck =
          RegExp(r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
              .hasMatch(password.value);

      passwordError.value = "";
      passwordCheckError.value = "";
      passwordValid.value = false;
      passwordCheckValid.value = false;

      if(passwordValidCheck) {
        passwordValid.value = true;
        passwordError.value = "";

        if(passwordCheck.value != "") {
          if(password.value == passwordCheck.value) {
            passwordCheckValid.value = true;
            passwordCheckError.value = "";
          }

          else {
            passwordCheckError.value = "비밀번호 확인을 정확하게 입력해주세요.";
            passwordCheckValid.value = false;
          }
        }
      }

      else {
        passwordError.value = "비밀번호를 양식에 맞게 입력해주세요.";
      }
  }

  void onChangeEmail(String newEmail) {
    email.value = newEmail;
  }

  void onChangePassword(String newPassword) {
    password.value = newPassword;
  }

  void onChangePasswordCheck(String newPasswordCheck) {
    passwordCheck.value = newPasswordCheck;
  }

  void onPressEmailDone(String _) {
    passwordFocus.requestFocus();
  }

  void onPressPasswordDone(String _) {
    passwordCheckFocus.requestFocus();
  }

  void onPressPasswordCheckDone(String _) {
    
  }
}