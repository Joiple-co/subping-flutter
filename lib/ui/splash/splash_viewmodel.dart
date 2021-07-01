import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/modules/secure/secure.dart';

class SplashViewModel {
  void validateLogin() {}

  Future<bool> initSecure() async {
    final secure = Secure();
    final isInitRSA = await secure.initRSA();

    return isInitRSA;
  }

  Future<bool> _checkLoggedIn() async {
    return false;
  }

  void goNextScene(BuildContext context) async {
    bool isSecureInitSucess;
    bool isLoggedIn;

    try {
      await Future.wait([initSecure(), _checkLoggedIn()]).then((value) {
        isSecureInitSucess = value[0];
        isLoggedIn = value[1];
      });

      if (isSecureInitSucess) {
        if (isLoggedIn) {
          // final cognito = Cognito();
          // print("logged in");
          // String nextScene = await cognito.checkCurrentUserOnboardingStatus();
          // print(nextScene);
          // Navigator.pushReplacementNamed(context, nextScene);
        } else {
          Get.offAndToNamed('/appIntro');
        }
      } else {
        ErrorHandler.errorHandler("SplashException");
      }
    } catch (e) {
      switch (e.code) {
        case "UserNotFoundException":
          Navigator.pushReplacementNamed(context, "/appIntro");
          break;
        default:
          ErrorHandler.errorHandler("SplashException");
      }
    }
  }
}
