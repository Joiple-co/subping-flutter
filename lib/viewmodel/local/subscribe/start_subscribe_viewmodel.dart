import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';

class StartSubscribeViewModel extends GetxController {
  RxMap<String, ProductModel> _products = <String, ProductModel>{}.obs;
  RxMap<String, int> _selectedProducts = <String, int>{}.obs;
  Rx<Period> _selectedPeriod = Period.ONE_MONTH.obs;

  void initProducts(List<ProductModel> products) {
    products.forEach((element) { 
      _products[element.id] = element;
    });

    _selectedProducts[_products[_products.keys.elementAt(0)].id] = 1;
  }

  void initPeriods(List<dynamic> periods) {
    _selectedPeriod.value = periods[0];
  }

  void onSelectProduct(String productId, int amount) {
    _selectedProducts[productId] = amount;
  }

  void onSelectPeriod(Period period) {
    _selectedPeriod.value = period;
  }
  
  int getSelectedTotalAmount() {
    int total = 0;

    _selectedProducts.forEach((key, value) { 
      total += _products[key].price;
    });

    return total;
  }

  Map<String, int> get selectedProducts {
    return _selectedProducts.value;
  }

  Map<String, ProductModel> get products {
    return _products.value;
  }

  Period get selectedPeriod {
    return _selectedPeriod.value;
  }
}
