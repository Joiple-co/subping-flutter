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

  void goAppIntro(BuildContext context) async {
    try {
      final isInitSucess = await _init();
      final isLoggedIn = await _checkLoggedIn();

      if (isInitSucess) {
        if (isLoggedIn) {
          print("loggedIn");
        }

        Navigator.pushReplacementNamed(context, "/appIntro");
      } else {
        ErrorHandler.errorHandler(context, "splashException");
      }
    } catch (e) {
      print(e);
    }
  }
}
