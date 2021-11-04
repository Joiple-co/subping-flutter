import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/add_card/add_card.dart';
import 'package:subping/ui/start_subscribe/subscribe_address.dart';
import 'package:subping/ui/start_subscribe/subscribe_card.dart';
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

    startSubscribeViewModel.initService(service);
    startSubscribeViewModel.initProducts(products);
    startSubscribeViewModel.initPeriods(service.period);
    startSubscribeViewModel.initCards(userViewModel.cards);

    if (service.type != "online") {
      startSubscribeViewModel.initAddresses(addresses);
    }

    return Obx(() {
      if (startSubscribeViewModel.step != StartSubscribeStep.RESULT) {
        return Scaffold(
            backgroundColor: SubpingColor.white100,
            body: HeaderSafe(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(service.serviceLogoUrl, height: 80),
                    ),
                    startSubscribeViewModel.isLoading
                        ? SubpingLoading()
                        : startSubscribeViewModel.success
                            ? Lottie.asset("assets/lottie/payment_success.json",
                                height: 100, repeat: false)
                            : Lottie.asset("assets/lottie/payment_failed.json",
                                height: 100, repeat: false),
                    SubpingText(service.name, size: SubpingFontSize.title5)
                  ],
                ),
              ),
            ));
      }

      return Scaffold(
          backgroundColor: SubpingColor.white100,
          appBar: TitleAppBar(
            "${service.name} 구독하기",
            hasBackButton: true,
          ),
          body: Column(children: [
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
                                customizable: service.customizable,
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
                      service.type != "online"
                          ? Container(
                              height: SubpingSize.medium10,
                              color: SubpingColor.back20)
                          : Container(),
                      service.type != "online"
                          ? Container(
                              child: HorizontalPadding(
                                child: SubscribeAddress(
                                    userViewModel: userViewModel,
                                    startSubscriveViewModel:
                                        startSubscribeViewModel),
                              ),
                            )
                          : Container(),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      Container(
                        child: HorizontalPadding(
                          child: SubscribeCard(
                            userViewModel: userViewModel,
                            startSubscribeViewModel: startSubscribeViewModel,
                          ),
                        ),
                      ),
                      Space(size: SubpingSize.medium14),
                    ]),
              ),
            ),
            SafeArea(
              bottom: true,
              child: SquareButton(
                text: "구독하기",
                onPressed: startSubscribeViewModel.onStartSubscribe,
                disabled: !startSubscribeViewModel.isValid,
                loading: startSubscribeViewModel.isLoading,
              ),
            ),
          ]));
    });
  }
}
