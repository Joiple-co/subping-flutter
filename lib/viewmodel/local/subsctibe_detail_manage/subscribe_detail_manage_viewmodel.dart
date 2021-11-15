import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/product_model.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/error_handler/error_handler.dart';
import 'package:subping/repository/subscribe_repository.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';
import 'package:subping/viewmodel/local/main_tabs/subscribe_manage/subscribe_manage_viewmodel.dart';

class SubscribeDetailManageViewModel extends GetxController
    with SingleGetTickerProviderMixin {
  TabController _tabController;

  final RxMap<String, int> _initProducts = <String, int>{}.obs;
  final RxMap<String, int> _selectedProducts = <String, int>{}.obs;
  final RxInt _selcectedPauseTimes = 1.obs;
  final RxBool _isChangedProduct = false.obs;
  final RxBool _isCancelItemChangeLoading = false.obs;
  final RxBool _isPeriodUpdateLoading = false.obs;
  final RxBool _isSubscribeItemUpdateLoading = false.obs;
  final RxBool _isSubscribeCancelLoading = false.obs;
  final RxBool _isSubscribePauseLoading = false.obs;

  final RxInt _index = 0.obs;

  final SubscribeRepository _subscribeRepository = SubscribeRepository();

  TabController get tabController {
    return _tabController;
  }

  int get index {
    return _index.value;
  }

  void checkIsChangedProduct() {
    bool isChangedInit = false;

    _selectedProducts.forEach((key, value) {
      if (_initProducts[key] != value) {
        isChangedInit = true;
      }
    });

    _isChangedProduct.value = isChangedInit;
  }

  void initSelectedProducts(
    List<SubscribeItem> products,
  ) {
    _selectedProducts.value = {};

    for (var product in products) {
      _selectedProducts[product.product.id] = product.amount;
      _initProducts[product.product.id] = product.amount;
    }

    _selectedProducts.refresh();
    checkIsChangedProduct();
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
    checkIsChangedProduct();
  }

  Future<void> updateSubscribeItems(
      String serviceId, String subscribeId) async {
    _isSubscribeItemUpdateLoading.value = true;
    final subscribeItems = [];

    _selectedProducts.forEach(
        (key, value) => subscribeItems.add({"id": key, "amount": value}));

    final result = await _subscribeRepository.updateSubscribe(
        serviceId, subscribeId,
        subscribeItems: subscribeItems);

    if (result == "success") {
      final _subscribeViewModel = Get.find<SubscribeViewModel>();
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

      _subscribeViewModel.updateSubscribe(serviceId);
      _subscribeManageViewModel.updateSubscribeSchedule();

      _isSubscribeItemUpdateLoading.value = false;

      Get.back();
    } else {
      _isSubscribeItemUpdateLoading.value = false;
      ErrorHandler.errorHandler("SubscribeItemUpdateException");
    }
  }

  Future<void> cancelSubscribeItemChange(
      String serviceId, String subscribeId) async {
    _isCancelItemChangeLoading.value = true;

    final result = await _subscribeRepository.cancelSubscribeItemsChange(
        serviceId, subscribeId);

    if (result == "success") {
      final _subscribeViewModel = Get.find<SubscribeViewModel>();
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

      _subscribeViewModel.updateSubscribe(serviceId);
      _subscribeManageViewModel.updateSubscribeSchedule();

      _isCancelItemChangeLoading.value = false;
    } else {
      _isCancelItemChangeLoading.value = false;

      ErrorHandler.errorHandler("CancelSubscribeItemChangeException");
    }
  }

  Future<void> cancelSubscribe(String subscribeId) async {
    _isSubscribeCancelLoading.value = true;

    final result = await _subscribeRepository.cancelSubscribe(subscribeId);

    if (result == "success") {
      final _subscribeViewModel = Get.find<SubscribeViewModel>();
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

      _subscribeViewModel.getSubscribes();
      _subscribeManageViewModel.updateSubscribeSchedule();

      _isSubscribeCancelLoading.value = false;
      Get.back();
    } else {
      _isSubscribeCancelLoading.value = false;
      ErrorHandler.errorHandler("CancelSubscribeException");
    }
  }

  Future<void> updatePeriod(
      String serviceId, String subscribeId, Period period) async {
    _isPeriodUpdateLoading.value = true;

    final result = await _subscribeRepository.updateSubscribe(
        serviceId, subscribeId,
        period: periodInnerString[period]);

    if (result == "success") {
      final _subscribeViewModel = Get.find<SubscribeViewModel>();
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

      _subscribeViewModel.updateSubscribe(serviceId);
      _subscribeManageViewModel.updateSubscribeSchedule();

      _isPeriodUpdateLoading.value = false;
    } else {
      _isPeriodUpdateLoading.value = false;
      ErrorHandler.errorHandler("PeriodUpdateException");
    }
  }

  Future<void> updatePauseSubscribe(String subscribeId, String serviceId,
      {bool cancel = false}) async {
    _isSubscribePauseLoading.value = true;

    String result;

    if (cancel) {
      result = await _subscribeRepository.cancelPauseSubscribe(
          subscribeId: subscribeId);
    } else {
      result = await _subscribeRepository.pauseSubscribe(
          subscribeId: subscribeId, pauseTimes: _selcectedPauseTimes.value);
    }

    if (result == "success") {
      final _subscribeViewModel = Get.find<SubscribeViewModel>();
      final _subscribeManageViewModel = Get.find<SubscribeManageViewModel>();

      _subscribeViewModel.updateSubscribe(serviceId);
      _subscribeManageViewModel.updateSubscribeSchedule();

      _isSubscribePauseLoading.value = false;

      if (!cancel) {
        Get.back();
      }
    } else {
      _isSubscribePauseLoading.value = false;

      if (cancel) {
        if (result == "PaymentException") {
          ErrorHandler.errorHandler(result);
        } else {
          ErrorHandler.errorHandler("CancelPauseSubscribeException");
        }
      } else {
        Get.back();

        ErrorHandler.errorHandler("PauseSubscribeException");
      }
    }
  }

  void onClickPauseRadio(int times) {
    _selcectedPauseTimes.value = times;
  }

  int getSelectedTotalCount() {
    int total = 0;

    _selectedProducts.forEach((key, value) {
      total += value;
    });

    return total;
  }

  int getSelectedTotalAmount(List<ProductModel> products) {
    int total = 0;
    Map<String, ProductModel> _products = {};

    for (var element in products) {
      _products[element.id] = element;
    }

    _selectedProducts.forEach((key, value) {
      total += _products[key].price * value;
    });

    return total;
  }

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      _index.value = _tabController.index;
    });
  }

  Map<String, int> get selectedProducts {
    return _selectedProducts;
  }

  bool get isChangedProduct {
    return _isChangedProduct.value;
  }

  bool get isCancelItemChangeLoading {
    return _isCancelItemChangeLoading.value;
  }

  bool get isPeriodUpdateLoading {
    return _isPeriodUpdateLoading.value;
  }

  bool get isSubscribeItemUpdateLoading {
    return _isSubscribeItemUpdateLoading.value;
  }

  bool get isSubscribeCancelLoading {
    return _isSubscribeCancelLoading.value;
  }

  bool get isSubscribePauseLoading {
    return _isSubscribePauseLoading.value;
  }

  int get selcectedPauseTimes {
    return _selcectedPauseTimes.value;
  }
}
