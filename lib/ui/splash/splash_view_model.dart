import 'package:flutter/material.dart';

class SplashViewModel {
  void validateLogin() {}

  void goAppIntro(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/appIntro");
  }
}
