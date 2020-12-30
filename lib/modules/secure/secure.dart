import 'dart:convert';

import 'package:crypton/crypton.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:subping/model/rsa_model.dart';
import 'package:subping/modules/api/api.dart';

class Secure {
  Future<bool> initRSA() async {
    final response = await API.get("auth", "/rsa", withAuth: false);
    final decodedResponse = jsonDecode(response.body);

    RSAModel data = RSAModel.fromJson(decodedResponse);

    if (data.success) {
      final store = new FlutterSecureStorage();
      store.write(key: "RSAKey", value: data.publicKey);

      return true;
    } else {
      return false;
    }
  }

  Future<String> encrpytRSA(String value) async {
    final store = new FlutterSecureStorage();
    final pemKey = await store.read(key: "RSAKey");

    print(pemKey);

    if (pemKey != null) {
      final key = RSAPublicKey.fromPEM(pemKey);
      return key.encrypt(value);
    } else {
      throw Exception("RSAKeyNotExist");
    }
  }
}
