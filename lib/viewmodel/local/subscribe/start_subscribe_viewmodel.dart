import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_card_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/subscribe_repository.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/subscribe_manage.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewModel.dart';

class StartSubscribeViewModel extends GetxController {
  RxMap<String, ProductModel> _products = <String, ProductModel>{}.obs;
  RxMap<String, int> _selectedProducts = <String, int>{}.obs;
  Rx<Period> _selectedPeriod = Period.ONE_MONTH.obs;
  RxString _selectedAddress = "".obs;
  RxString _selectedCard = "".obs;
  RxBool _isLoading = false.obs;
  ServiceModel _service;

  SubscribeRepository _subscribeRepository = SubscribeRepository();

  void initService(ServiceModel service) {
    _service = service;
  }

  void initProducts(List<ProductModel> products) {
    products.forEach((element) { 
      _products[element.id] = element;
    });
    
    _selectedProducts.value = {};
    _selectedProducts[_products[_products.keys.elementAt(0)].id] = 1;
  }

  void initAddresses(Map<String, UserAddressModel> addresses) {
    final addressIds = addresses.keys;

    if(addressIds.length != 0) {
      _selectedAddress.value = addressIds.elementAt(0);

      addressIds.forEach((id) {
        if(addresses[id].isDefault != null && addresses[id].isDefault) {
          _selectedAddress.value = id;
        }
      });
    }
  }

  void initPeriods(List<dynamic> periods) {
    _selectedPeriod.value = periods[0];
  }

  void initCards(Map<String, UserCardModel> cards) {
    final cardIds = cards.keys;

    if(cardIds.length != 0) {
      _selectedCard.value = cardIds.elementAt(0);
    }
  }
  
  void onSelectProduct(String productId, int amount, {bool customizable}) {
    if(amount < 0) {
      return;
    }

    if(customizable) {
      if(amount == 0) {
        if(getSelectedTotalCount() > 1) {
          _selectedProducts.remove(productId);
        }
      } else {
        _selectedProducts[productId] = amount;
      }
    } else {
      _selectedProducts.value = {};
      _selectedProducts[productId] = amount;
    }
    
    _selectedProducts.refresh();
  }

  void onStartSubscribe() async {
    _isLoading.value = true;
    
    final subscribeItems = [];

    _selectedProducts.forEach((key, value) => subscribeItems.add({
      "id": key, "amount": value 
    }));

    final result = await _subscribeRepository.makeSubscribe(
      subscribeItems: subscribeItems,
      userCardId: _selectedCard.value,
      addressId: _selectedAddress.value,
      period: PeriodInnerString[_selectedPeriod.value],
      serviceId: _service.id
    );

    if(result) { // 성공시
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();
      final _subscribeViewModel = Get.find<SubscribeViewModel>();

      _subscribeManageViewModel.updateSubscribeSchedule();
      _subscribeViewModel.getSubscribes();

      Get.back();
    } 

    _isLoading.value = false;
  }

  void onSelectPeriod(Period period) {
    _selectedPeriod.value = period;
  }
  
  void onSelectAddress(String addressId) {
    _selectedAddress.value = addressId;
  }

  void onSelectCard(String cardId) {
    _selectedCard.value = cardId;
  }

  int getSelectedTotalAmount() {
    int total = 0;

    _selectedProducts.forEach((key, value) { 
      total += _products[key].price * value;
    });

    return total;
  }

  int getSelectedTotalCount() {
    int total = 0;

    _selectedProducts.forEach((key, value) { 
      total += value;
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

  String get selectedAddress {
    return _selectedAddress.value;
  }

  String get selectedCard {
    return _selectedCard.value;
  }

  bool get isValid {
    bool valid = getSelectedTotalCount() != 0 && _selectedPeriod != null && _selectedCard.value != null;

    if(_service.type != "online") {
      valid = valid && _selectedAddress.value != "";
    }

    return valid;
  }

  bool get isLoading {
    return _isLoading.value;
  }
}
