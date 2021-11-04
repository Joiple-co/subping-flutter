import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/model/user_address_model.dart';
import 'package:subping/model/user_card_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/subscribe_repository.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

enum StartSubscribeStep { select, result }

class StartSubscribeViewModel extends GetxController {
  final RxMap<String, ProductModel> _products = <String, ProductModel>{}.obs;
  final RxMap<String, int> _selectedProducts = <String, int>{}.obs;
  final Rx<Period> _selectedPeriod = Period.oneMonth.obs;
  final RxString _selectedAddress = "".obs;
  final RxString _selectedCard = "".obs;
  final Rx<StartSubscribeStep> _step = StartSubscribeStep.select.obs;

  final RxBool _isLoading = false.obs;
  final RxBool _success = false.obs;
  final RxString _loadingMessage = "구독을 만드는 중입니다.".obs;

  ServiceModel _service;

  final SubscribeRepository _subscribeRepository = SubscribeRepository();

  void initService(ServiceModel service) {
    _service = service;
  }

  void initProducts(List<ProductModel> products) {
    for (var element in products) {
      _products[element.id] = element;
    }

    _selectedProducts.value = {};
    _selectedProducts[_products[_products.keys.elementAt(0)].id] = 1;
  }

  void initAddresses(Map<String, UserAddressModel> addresses) {
    final addressIds = addresses.keys;

    if (addressIds.isNotEmpty) {
      _selectedAddress.value = addressIds.elementAt(0);

      for (var id in addressIds) {
        if (addresses[id].isDefault != null && addresses[id].isDefault) {
          _selectedAddress.value = id;
        }
      }
    }
  }

  void initPeriods(List<dynamic> periods) {
    if (periods.isNotEmpty) {
      _selectedPeriod.value = periods[0];
    } else {
      ErrorHandler.errorHandler("StartSubscribeInitializeException");
    }
  }

  void initCards(Map<String, UserCardModel> cards) {
    final cardIds = cards.keys;

    if (cardIds.isNotEmpty) {
      _selectedCard.value = cardIds.elementAt(0);
    }
  }

  void onSelectProduct(String productId, int amount, {bool customizable}) {
    if (amount < 0) {
      return;
    }

    if (customizable) {
      if (amount == 0) {
        if (getSelectedTotalCount() > 1) {
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
    _step.value = StartSubscribeStep.result;

    final subscribeItems = [];

    _selectedProducts.forEach(
        (key, value) => subscribeItems.add({"id": key, "amount": value}));

    final result = await _subscribeRepository.makeSubscribe(
        subscribeItems: subscribeItems,
        userCardId: _selectedCard.value,
        addressId: _selectedAddress.value,
        period: periodInnerString[_selectedPeriod.value],
        serviceId: _service.id);

    if (result == "success") {
      // 성공시
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();
      final _subscribeViewModel = Get.find<SubscribeViewModel>();

      _subscribeManageViewModel.updateSubscribeSchedule();
      _subscribeViewModel.getSubscribes();

      _success.value = true;
      _loadingMessage.value = "구독을 만들었어요!";
    } else {
      _success.value = false;

      if (result == "UserHasSameServiceSubscribeException") {
        _loadingMessage.value =
            "이미 해당 서비스를 구독하고 있어요!\n구독 관리를 통해 구독을 변경할 수 있어요.";
      } else if (result == "MakeSubscribeException") {
        _loadingMessage.value = "구독을 만드는데 실패했어요.\n잠시 뒤에 다시 시도해주세요.";
      } else if (result == "PaymentException") {
        _loadingMessage.value == "결제에 실패했어요.\n카드를 확인해주세요!\n(한도초과, 분실, 정지 등)";
      } else {
        _loadingMessage.value == "알 수 없는 에러입니다.\n고객센터로 문의 부탁드립니다.";
      }
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
    return _selectedProducts;
  }

  Map<String, ProductModel> get products {
    return _products;
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
    bool valid = getSelectedTotalCount() != 0 &&
        _selectedPeriod != null &&
        _selectedCard.value != "";

    if (_service.type != "online") {
      valid = valid && _selectedAddress.value != "";
    }

    return valid;
  }

  bool get isLoading {
    return _isLoading.value;
  }

  bool get success {
    return _success.value;
  }

  StartSubscribeStep get step {
    return _step.value;
  }
}
