import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:subping/modules/cognito/cognito.dart';

class UserViewModel extends GetxController {
  Cognito _cognito = Cognito();
  Rx<String> _username = "사용자".obs;
  Rx<String> _email = "잠시만 기다려주세요".obs;

  UserViewModel()  {
    updateInfo();
  }

  void updateInfo() async {
    final userAttr = await _cognito.currentUser(email: true, name: true);

    _username.value = userAttr['name'];
    _email.value = userAttr['email'];
  }

  String get name {
    return _username.value;
  }

  String get email {
    return _email.value;
  }
}