import 'package:subping/model/product_model.dart';
import 'package:subping/viewmodel/global/product_viewmodel.dart';
import 'package:test/test.dart';

void main() {
  group('[viewmodel/global/product_viewmodel]', () {
    test('products should empty map at start', () {
      expect(ProductViewModel().products, {});
    });

    test('getCheapeastPrice() should return cheapest price', () {
      final products = [
          ProductModel(price: 10000),
          ProductModel(price: 20000),
          ProductModel(price: 30000),
          ProductModel(price: 40000),
          ProductModel(price: 1000),
          ProductModel(price: 2000),
      ];

      final productViewModel = ProductViewModel();
      expect(productViewModel.getCheapestPrice(products), "1,000");
    });

    test('getCheapeastPrice() should return 0 when there are no prices', () {
       final products = [
          ProductModel(),
          ProductModel(),
          ProductModel(),
          ProductModel(),
          ProductModel(),
          ProductModel(),
      ];

      final productViewModel = ProductViewModel();
      expect(productViewModel.getCheapestPrice(products), "0");
    });
  });
}