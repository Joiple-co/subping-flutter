import 'package:flutter/material.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class PassAuthViewModel with ChangeNotifier {
  void onPressComplete(BuildContext context) async {
    try {
      final cognito = Cognito();

      final response = await cognito.signUpDone(
          name: "정승우",
          phoneNumber: "01088812173",
          carrier: "SKT",
          ci: "testCI",
          birthDay: "19980803");

      if (response.success) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", ModalRoute.withName("/appIntro"));
      } else {
        ErrorHandler.errorHandler(context, response.message);
      }
    } catch (e) {
      ErrorHandler.errorHandler(context, "default");
    }
  }
}
