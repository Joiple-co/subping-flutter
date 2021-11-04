import 'package:get/get.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/repository/product_repository.dart';

class ProductViewModel extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final Map<String, RxList<ProductModel>> _products =
      <String, RxList<ProductModel>>{}.obs;

  Future<void> updateProducts(String serviceId) async {
    final products = await _productRepository.getProducts(serviceId);

    products.sort((a, b) {
      return b.price - a.price;
    });

    if (_products[serviceId] != null) {
      _products[serviceId].value = products;
    } else {
      _products[serviceId] = products.obs;
    }

    _products[serviceId].refresh();
  }

  String getCheapestPrice(List<ProductModel> products) {
    num cheapestPrice = double.infinity;

    for (var element in products) {
      if (element.price != null && element.price < cheapestPrice) {
        cheapestPrice = element.price;
      }
    }

    if (cheapestPrice != double.infinity) {
      return Helper.setComma(cheapestPrice);
    } else {
      return "0";
    }
  }

  String getCheapeastPriceInService(String serviceId) {
    final products = _products[serviceId];

    if (products != null) {
      return getCheapestPrice(products);
    } else {
      return "0";
    }
  }

  List<ProductModel> getProducts(String serviceId) {
    if (_products[serviceId] != null) {
      return _products[serviceId].value;
    } else {
      return [];
    }
  }

  Map<String, RxList<ProductModel>> get products {
    return _products;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
