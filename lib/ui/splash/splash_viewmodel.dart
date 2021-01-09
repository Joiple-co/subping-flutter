import 'package:flutter/material.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/modules/secure/secure.dart';

class SplashViewModel {
  void validateLogin() {}

  Future<bool> _init() async {
    final secure = Secure();
    final isInitRSA = await secure.initRSA();

    if (isInitRSA) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _checkLoggedIn() async {
    final cognito = Cognito();
    final isLogin = await cognito.getCredentials();

    return isLogin != null;
  }

  void goNextScene(BuildContext context) async {
    bool isInitSucess;
    bool isLoggedIn;

    try {
      await Future.wait([_init(), _checkLoggedIn()]).then((value) {
        isInitSucess = value[0];
        isLoggedIn = value[1];
      });

      if (isInitSucess) {
        if (isLoggedIn) {
          final cognito = Cognito();
          print("logged in");
          String nextScene = await cognito.checkCurrentUserOnboardingStatus();
          print(nextScene);
          Navigator.pushReplacementNamed(context, nextScene);
        } else {
          Navigator.pushReplacementNamed(context, "/appIntro");
        }
      } else {
        ErrorHandler.errorHandler(context, "SplashException");
      }
    } catch (e) {
      switch (e.code) {
        case "UserNotFoundException":
          Navigator.pushReplacementNamed(context, "/appIntro");
          break;
        default:
          ErrorHandler.errorHandler(context, "SplashException");
      }
    }
  }
}
