import 'dart:convert';

import 'package:subping/model/address_model.dart';
import 'package:subping/model/body_model.dart';
import 'package:subping/modules/api/api.dart';

class AddressRepository {
  Future<BodyModel> makeAddress(AddressModel address) async {
    final response = await API.post("user", "/makeAddress", body: {
      'addressName': address.addressName,
      'postCode': address.postCode,
      'address': address.address,
      'detailedAddress': address.detailedAddress,
      'isDefault': address.isDefault
    });

    final jsonBody = utf8.decode(response.data);
    BodyModel body = BodyModel.fromJson(jsonDecode(jsonBody));

    return body;
  }
}
