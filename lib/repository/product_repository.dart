import 'dart:convert';

import 'package:subping/model/body_model.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/modules/api/api.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts(String serviceId) async {
    List<ProductModel> products = <ProductModel>[];

    try {
      final rawResponse = await API
          .post("service", "/getProducts", body: {'service': serviceId});

      final decodedResponse = utf8.decode(rawResponse.data);
      BodyModel response = BodyModel.fromJson(jsonDecode(decodedResponse));

      if (response.success) {
        response.message.forEach((value) {
          products.add(ProductModel.fromJson(value));
        });
      }

      return products;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return [];
    }
  }
}
