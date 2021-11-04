import 'package:subping/model/product_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:test/test.dart';

void main() {
  group('[viewmodel/global/subscribe_viewmodel]', () {
    test('subscribe should empty map at start', () {
      expect(SubscribeViewModel().subscribe, {});
    });

    test('totalprice should return total price of subscribes', () {
      final subscribeViewModel = SubscribeViewModel();

      final subscribes = {
        "serviceId1": SubscribeModel(subscribeItems: [
          SubscribeItem(amount: 1, product: ProductModel(price: 1000))
        ]),
        "serviceId2": SubscribeModel(subscribeItems: [
          SubscribeItem(amount: 2, product: ProductModel(price: 2000))
        ]),
        "serviceId3": SubscribeModel(subscribeItems: [
          SubscribeItem(amount: 0, product: ProductModel(price: 5000))
        ])
      };

      expect(subscribeViewModel.totalPrice, 0);

      subscribeViewModel.subscribe = subscribes;

      expect(subscribeViewModel.totalPrice, 5000);
    });
  });
}