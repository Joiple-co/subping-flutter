import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_card_model.dart';
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
        if (response.message == "NoUserExistException") {
        ErrorHandler.errorHandler("NoUserExistException");
        } else {
          ErrorHandler.errorHandler("GetUserException");
          return UserModel();
        }
      }
    } catch (e) {
      print("[UserRepository Error] getUser : ${e}");
      return UserModel(nickName: "사용자님");
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

  Future<bool> editUserAddress(UserAddressModel address) async {
    try{
     final rawResponse = await API.post("user", "/editUserAddress", body: {
        "addressId": address.id,
        "userName": address.userName,
        "userPhoneNumber": address.userPhoneNumber,
        "postCode": address.postCode,
        "address": address.address,
        "detailedAddress": address.detailedAddress,
        "isDefault": address.isDefault
      });

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (!response.success) {
        ErrorHandler.errorHandler("EditUserAddressException");
      }

      return response.success;
    } catch (e) {
      ErrorHandler.errorHandler("EditUserAddressException");
    }
  }

  Future<List<UserCardModel>> getUserCards() async {
    final result = <UserCardModel>[];

    try {
      final rawResponse = await API.get("user", "/getUserCards");

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        response.message
            .forEach((address) => result.add(UserCardModel.fromJson(address)));
      } else {
        ErrorHandler.errorHandler("GetUserCardsException");
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("GetUserCardsException");
    }

    return result;
  }

  Future<void> addCard(String cardVendor, String billingKey, String method,
      String pg, String cardName) async {
    try {
      final rawResponse = await API.post("user", "/createUserCard", body: {
        "cardVendor": cardVendor,
        "billingKey": billingKey,
        "method": method,
        "pg": pg,
        "cardName": cardName
      });

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      print(response.message);
      
      if (!response.success) {
        ErrorHandler.errorHandler("AddCardException");
      }
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("AddCardException");
    }
  }

  Future<bool> deleteCard(String cardId) async {
    try {
      final rawResponse = await API.post("user", "/deleteUserCard", body: {
        "cardId": cardId
      });

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      print(response.message);
      
      if (!response.success) {
        ErrorHandler.errorHandler("DeleteCardException");
      }

      return response.success;
    } catch (e) {
      print(e);
      ErrorHandler.errorHandler("DeleteCardException");
    }
  }
}
