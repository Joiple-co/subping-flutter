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

  ServiceDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    final productViewModel = Get.find<ProductViewModel>();
    final subscribeViewModel = Get.find<SubscribeViewModel>();

    serviceViewModel.updateService(serviceId, page: true);
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
                              SubpingText(
                                service.summary,
                                size: null,
                              ),
                              Space(size: SubpingSize.large20),
                              SubpingText(
                                "${productViewModel.getCheapeastPriceInService(serviceId)}원 ~",
                                size: SubpingFontSize.title6,
                                fontWeight: SubpingFontWeight.bold,
                              ),
                              Space(size: SubpingSize.large20),
                              const Divider(),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              Row(
                                children: [
                                  SubpingText(
                                    "카테고리",
                                    color: SubpingColor.black60,
                                    size: null,
                                  ),
                                  Space(
                                    size: SubpingSize.large25,
                                  ),
                                  SubpingText(
                                    service.category != null
                                        ? service.category.join(",")
                                        : "",
                                    size: null,
                                  )
                                ],
                              ),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              const Divider(),
                              Space(
                                size: SubpingSize.large15,
                              ),
                              Row(
                                children: [
                                  SubpingText(
                                    "제품설명",
                                    color: SubpingColor.black60,
                                    size: null,
                                  ),
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
                      products.isNotEmpty
                          ? Container(
                              height: SubpingSize.medium10,
                              color: SubpingColor.back20)
                          : Container(),
                      products.isNotEmpty
                          ? ServiceProducts(
                              products: products,
                            )
                          : Container(),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      const ServiceReview(
                        reviews: [],
                      ),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      const ServiceInfo()
                    ],
                  ),
                ),
              ]),
            ),
            ServiceFooter(
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
