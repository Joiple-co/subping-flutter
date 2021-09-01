import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/start_subscribe/subscribe_address.dart';
import 'package:subping/ui/start_subscribe/subscribe_item.dart';
import 'package:subping/ui/start_subscribe/subscribe_period.dart';
import 'package:subping/ui/start_subscribe/subscribe_service.dart';
import 'package:subping/viewmodel/global/product_viewmodel.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class StartSubscribe extends StatelessWidget {
  final String serviceId = Get.parameters['param'];

  StartSubscribe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final productViewModel = Get.find<ProductViewModel>();
    final startSubscribeViewModel = Get.find<StartSubscribeViewModel>();
    final userViewModel = Get.find<UserViewModel>();

    final service = serviceViewModel.getService(serviceId);
    final products = productViewModel.getProducts(serviceId);
    final addresses = userViewModel.userAddreses;

    startSubscribeViewModel.initProducts(products);
    startSubscribeViewModel.initPeriods(service.period);
    startSubscribeViewModel.initAddresses(addresses);

    return Scaffold(
      backgroundColor: SubpingColor.white100,
      appBar: TitleAppBar(
        "${service.name} 구독하기",
        hasBackButton: true,
      ),
      body: HeaderSafe(
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: HorizontalPadding(
                          child: SubscribeService(
                        service: service,
                      )),
                    ),
                    Container(
                        height: SubpingSize.medium10,
                        color: SubpingColor.back20),
                    Container(
                      child: HorizontalPadding(
                          child: SubscribeItem(
                              // customizable: service.customizable,
                              customizable: true,
                              startSubscribeViewModel:
                                  startSubscribeViewModel)),
                    ),
                    Container(
                        height: SubpingSize.medium10,
                        color: SubpingColor.back20),
                    Container(
                      child: HorizontalPadding(
                        child: SubscribePeriod(
                          service: service,
                          startSubscribeViewModel: startSubscribeViewModel,
                        ),
                      ),
                    ),
                    Container(
                        height: SubpingSize.medium10,
                        color: SubpingColor.back20),
                    Container(
                      child: HorizontalPadding(
                        child: SubscribeAddress(
                            userViewModel: userViewModel,
                            startSubscriveViewModel: startSubscribeViewModel),
                      ),
                    ),
                    Container(
                        height: SubpingSize.medium10,
                        color: SubpingColor.back20),
                  ]),
            ),
          ),
          Space(
            size: SubpingSize.large20,
          )
        ]),
      ),
    );
  }
}
