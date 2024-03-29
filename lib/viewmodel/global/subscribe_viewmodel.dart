import 'package:get/get.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/repository/subscribe_repository.dart';

class SubscribeViewModel extends GetxController {
  final SubscribeRepository _subscribeRepository = SubscribeRepository();
  final RxMap<String, SubscribeModel> _subscribe =
      <String, SubscribeModel>{}.obs;

  Future<void> getSubscribes() async {
    List<SubscribeModel> subscribes =
        await _subscribeRepository.getSubscribes();

    _subscribe.value = {};

    for (var subscribe in subscribes) {
      final serviceId = subscribe.serviceId;
      _subscribe[serviceId] = subscribe;
    }

    _subscribe.refresh();
  }

  Future<void> updateSubscribe(String serviceId) async {
    SubscribeModel subscribe =
        await _subscribeRepository.getSubscribe(serviceId: serviceId);

    if (subscribe != null) {
      if (_subscribe[subscribe.serviceId] == null) {
        _subscribe[subscribe.serviceId] = subscribe;
      } else {
        _subscribe[subscribe.serviceId].updateSubscribeModel(subscribe);
      }
      _subscribe.refresh();
    } else {
      _subscribe.remove(serviceId);
      _subscribe.refresh();
    }
  }

  num get totalPrice {
    num totalPrice = 0;

    _subscribe.forEach((key, value) {
      for (var element in value.subscribeItems) {
        totalPrice += element.amount * element.product.price;
      }
    });

    return totalPrice;
  }

  Map<String, SubscribeModel> get subscribe {
    return _subscribe;
  }

  set subscribe(Map<String, SubscribeModel> subscribes) {
    _subscribe.value = subscribes;
  }
}
