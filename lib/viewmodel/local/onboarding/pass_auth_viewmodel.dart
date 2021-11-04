import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:subping/modules/cognito/cognito.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/viewmodel/global/auth_viewmodel.dart';

class PassAuthViewModel extends GetxController {
  RxMap<String, String> currentTitle =
      {"preTitle": "서비스 이용을 위해\n", "accent": "본인인증", "postTitle": "이 필요해요"}.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onPressNext() async {
    try {
      loading.value = true;

      final authViewModel = Get.find<AuthViewModel>();

      final userAttributes = {
        "name": "정승우",
      };

      final validationData = {
        "name": "정승우",
        "phone_number": "01088812173",
        "carrier": "SKT",
        "ci": "testCI",
        "birthdate": "1998-08-03",
        "gender": "M"
      };

      SignUpResult result = await Cognito().signUp(authViewModel.email,
          authViewModel.password, userAttributes, validationData);

      if (result.isSignUpComplete) {
        await Cognito().signIn(authViewModel.email, authViewModel.password);
        Get.offAndToNamed("/splash");
      } else {
        ErrorHandler.errorHandler("default");
      }

      loading.value = false;
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("default");
    }
  }
}
