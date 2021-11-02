import 'package:get/get.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/repository/subscribe_repository.dart';

class SubscribeViewModel extends GetxController {
  SubscribeRepository _subscribeRepository = SubscribeRepository();
  RxMap<String, SubscribeModel> _subscribe = <String, SubscribeModel>{}.obs;

  void getSubscribes() async {
    List<SubscribeModel> subscribes = await _subscribeRepository.getSubscribes();
    
    _subscribe.value = {};

    subscribes.forEach((subscribe) {
      final serviceId = subscribe.serviceId;
      _subscribe[serviceId] = subscribe;
    }); 

    _subscribe.refresh();
  }

  void updateSubscribe(String serviceId) async {
    SubscribeModel subscribe = await _subscribeRepository.getSubscribe(serviceId: serviceId);

    if(subscribe != null) {
      _subscribe[subscribe.serviceId] = subscribe;
      _subscribe.refresh();
    } else {
      _subscribe.remove(serviceId);
      _subscribe.refresh();
    }
  }
  
  num get totalPrice {
    num totalPrice = 0;

    _subscribe.forEach((key, value) { 
      value.subscribeItems.forEach((element) {
       totalPrice +=  element.amount * element.product.price;
      });
    });

    return totalPrice;
  }

  Map<String, SubscribeModel> get subscribe {
    return _subscribe;
  }
}
