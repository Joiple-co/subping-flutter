import 'package:get/get.dart';
import 'package:subping/model/user_model.dart';
import 'package:subping/repository/user_repository.dart';

class UserViewModel extends GetxController {
  UserRepository _userRepository = UserRepository();

  Rx<UserModel> _user = UserModel().obs;

  void updateInfo() async {
    _user.value.updateUserModel(await _userRepository.getUser());
    _user.refresh();
    this.checkUserStatus();
  }
  
  void checkUserStatus() {
    if(_user.value.nickName == null) {
      Get.offAndToNamed("/createNickName");
    }
  }

  String get name {
    return _user.value.name;
  }

  String get email {
    return _user.value.email;
  }

  String get nickName {
    return _user.value.nickName;
  }

  String get userProfileImageUrl {
    return _user.value.userProfileImageUrl ?? "";
  }
}