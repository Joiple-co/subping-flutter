
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class PassAuthViewModel extends GetxController{
  RxMap<String, String> currentTitle = {
    "preTitle": "서비스 이용을 위해\n",
    "accent": "본인인증",
    "postTitle": "이 필요해요"
  }.obs;
  
  void onInit() {
    super.onInit();
  }

  void onPressNext() async {
    try {
      final cognito = Cognito();

      final response = await cognito.signUpDone(
          name: "정승우",
          phoneNumber: "01088812173",
          carrier: "SKT",
          ci: "testCI",
          birthday: "19980803");

      print(response.message);

      if (response.success) {
        Get.offNamedUntil("/userLogin", ModalRoute.withName("/appIntro"));
      } else {
        ErrorHandler.errorHandler(response.message);
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("default");
    }
  }
}