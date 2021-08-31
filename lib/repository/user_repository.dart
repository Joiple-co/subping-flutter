import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_model.dart';
import 'package:subping/modules/api/api.dart';
import 'package:subping/modules/error_handler/error_handler.dart';

class UserRepository {
  Future<UserModel> getUser() async {
    try {
      final rawResponse = await API.get("user", "/getUserInfo");

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        final user = UserModel.fromJson(response.message);
        return user;
      } else {
        ErrorHandler.errorHandler("GetUserException");
        return UserModel();
      }
    } catch (e) {
      print(e);
      return UserModel();
    }
  }

  Future<bool> nickNameDuplicate(String nickName) async {
    try {
      final rawResponse = await API
          .post("user", "/duplicateNickName", body: {"nickName": nickName});

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        return response.message;
      } else {
        ErrorHandler.errorHandler("NickNameDuplicateException");
        return false;
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("NickNameDuplicateException");
      return false;
    }
  }

  Future<bool> updateNickName(String nickName) async {
    try {
      final rawResponse = await API
          .post("user", "/updateNickName", body: {"nickName": nickName});

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        return true;
      } else {
        ErrorHandler.errorHandler("NickNameUpdateException");
        return false;
      }
    } catch (e) {
      ErrorHandler.errorHandler("NickNameUpdateException");
      return false;
    }
  }

  Future<List<UserAddressModel>> getUserAddresses() async {
    final result = <UserAddressModel>[];

    try {
      final rawResponse = await API.get("user", "/getUserAddresses");

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        response.message.forEach(
            (address) => result.add(UserAddressModel.fromJson(address)));
      } else {
        ErrorHandler.errorHandler("GetUserAddressesException");
      }
    } catch (e) {
      ErrorHandler.errorHandler("GetUserAddressesException");
    }
    
    return result;
  }

  Future<void> makeUserAddress(UserAddressModel address) async {
    try {
      final rawResponse = await API.post("user", "/makeUserAddress", body: {
        "userName": address.userName,
        "userPhoneNumber": address.userPhoneNumber,
        "postCode": address.postCode,
        "address": address.address,
        "detailedAddress": address.detailedAddress,
        "isDefault": address.isDefault
      });

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      print(response.message);

      if (!response.success) {
        ErrorHandler.errorHandler("MakeUserAddressException");
      }
    } catch (e) {
      ErrorHandler.errorHandler("MakeUserAddressException");
    }
  }
}
