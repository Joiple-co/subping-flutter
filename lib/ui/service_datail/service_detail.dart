import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/service_datail/service_footer.dart';
import 'package:subping/ui/service_datail/service_info.dart';
import 'package:subping/ui/service_datail/service_products.dart';
import 'package:subping/ui/service_datail/service_review.dart';
import 'package:subping/viewmodel/global/product_viewmodel.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';
import 'package:subping/viewmodel/global/subscribe_viewmodel.dart';

class ServiceDetail extends StatelessWidget {
  final serviceId = Get.parameters['param'];

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final productViewModel = Get.find<ProductViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();

    serviceViewModel.updateService(serviceId);
    productViewModel.updateProducts(serviceId);
    subscribeViewModel.updateSubscribe(serviceId);

    return Obx(() {
      final service = serviceViewModel.services[serviceId].value;
      final products = productViewModel.getProducts(serviceId);

      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TitleAppBar(
          service.name,
          hasBackButton: true,
        ),
        body: Container(
          color: SubpingColor.white100,
          child: Column(children: [
            Expanded(
              child: ListView(children: [
                HeaderSafe(
                  child: Column(
                    children: [
                      Image.network(
                          service.serviceLogoUrl ??
                              "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
                          width: 828.w,
                          height: 828.w,
                          fit: BoxFit.fill),
                      HorizontalPadding(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Space(size: SubpingSize.large15),
                              Row(
                                children: [
                                  SubpingText(
                                    service.name,
                                    size: SubpingFontSize.title5,
                                    fontWeight: SubpingFontWeight.bold,
                                  ),
                                  service.tag != null
                                      ? Row(
                                          children: List.generate(
                                              service.tag.length,
                                              (index) => PoundButton(
                                                    "#${service.tag[index]}",
                                                    marginFlag: true,
                                                  )),
                                        )
                                      : Container()
                                ],
                              ),
                              Space(
                                size: SubpingSize.medium10,
                              ),
                              SubpingText(service.summary),
                              Space(size: SubpingSize.large20),
                              SubpingText(
                                "${productViewModel.getCheapeastPrice(serviceId)}원 ~",
                                size: SubpingFontSize.title6,
                                fontWeight: SubpingFontWeight.bold,
                              ),
                              Space(size: SubpingSize.large20),
                              Divider(),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              Row(
                                children: [
                                  SubpingText("카테고리",
                                      color: SubpingColor.black60),
                                  Space(
                                    size: SubpingSize.large25,
                                  ),
                                  SubpingText(service.category != null
                                      ? service.category.join(",")
                                      : "")
                                ],
                              ),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              Divider(),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              Row(
                                children: [
                                  SubpingText("제품설명",
                                      color: SubpingColor.black60),
                                  Space(
                                    size: SubpingSize.large25,
                                  ),
                                  Expanded(
                                    child: SubpingText(
                                      service.summary,
                                      size: null,
                                    ),
                                  ),
                                ],
                              ),
                              Space(size: SubpingSize.large25)
                            ]),
                      ),
                      products.length != 0
                          ? Container(
                              height: SubpingSize.medium10,
                              color: SubpingColor.back20)
                          : Container(),
                      products.length != 0
                          ? ServiceProducts(
                              products: products,
                            )
                          : Container(),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      ServiceReview(
                        reviews: [],
                        serviceId: serviceId,
                      ),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      ServiceInfo()
                    ],
                  ),
                ),
              ]),
            ),
            ServiceFooter(
                serviceLogoUrl: service.serviceLogoUrl,
                serviceName: service.name,
                userLike: service.like,
                toggleUserLike: () =>
                    serviceViewModel.toggleUserLike(serviceId),
                serviceId: serviceId,
                products: products,
                subscribes: subscribeViewModel.subscribe)
          ]),
        ),
      );
    });
  }
}
