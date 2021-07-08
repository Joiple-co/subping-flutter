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
    Cognito cognito = Cognito();
    return await cognito.checkLoggedIn();
  }

  void goNextScene() async {
    bool isSecureInitSucess;
    bool isLoggedIn;

    try {
      await Future.wait([initSecure(), _checkLoggedIn()]).then((value) {
        isSecureInitSucess = value[0];
        isLoggedIn = value[1];
      });
      
      if (isSecureInitSucess) {
        if (isLoggedIn) {
          Get.offAllNamed("/category");
        } else {
          Get.offAllNamed("/appIntro");
        }
      } else {
        ErrorHandler.errorHandler("SplashException");
      }
    } catch (e) {
      ErrorHandler.errorHandler("SplashException");
    }
  }
}
