import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/viewmodel/global/auth_viewmodel.dart';

class PassAuthViewModel extends GetxController {
  RxMap<String, String> currentTitle =
      {"preTitle": "서비스 이용을 위해\n", "accent": "본인인증", "postTitle": "이 필요해요"}.obs;
  RxBool loading = false.obs;

  void onInit() {
    super.onInit();
  }

  void onPressNext() async {
    try {
      final authViewModel = Get.find<AuthViewModel>();
      print(authViewModel.email);
      print(authViewModel.password);

      final userAttributes = {
        "name": "정승우",
        "phoneNumber": "01088812173",
        "carrier": "SKT",
        "ci": "testCI",
        "birthday": "1998-08-03",
        "gender": "M"
      };

      SignUpResult result = await Amplify.Auth.signUp(
          username: authViewModel.email,
          password: authViewModel.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      print(result);
      
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("default");
    }
  }
}
