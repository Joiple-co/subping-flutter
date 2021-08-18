import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/review_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/service_datail/service_footer.dart';
import 'package:subping/ui/service_datail/service_info.dart';
import 'package:subping/ui/service_datail/service_review.dart';
import 'package:subping/viewmodel/global/service_viewmodel.dart';

class ServiceDetail extends StatelessWidget {
  final serviceId = Get.parameters['param'];

  @override
  Widget build(BuildContext context) {
    final serviceViewModel = Get.find<ServiceViewModel>();
    serviceViewModel.updateService(serviceId);

    return Obx(() {
      final service = serviceViewModel.services[serviceId];
      
      return Scaffold(
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
                                  Row(
                                    children: List.generate(
                                        2,
                                        (index) => PoundButton(
                                              service.tag[index],
                                              marginFlag: true,
                                            )),
                                  )
                                ],
                              ),
                              Space(
                                size: SubpingSize.medium10,
                              ),
                              SubpingText(service.summary),
                              Space(size: SubpingSize.large20),
                              SubpingText(
                                "9,000원 ~",
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
                                  SubpingText(service.category.join(","))
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
                                  Wrap(children: [
                                    SubpingText(
                                      service.summary,
                                      size: null,
                                    )
                                  ]),
                                ],
                              ),
                              Space(size: SubpingSize.large25)
                            ]),
                      ),
                      Container(
                          height: SubpingSize.medium10,
                          color: SubpingColor.back20),
                      ServiceReview(
                        reviews: [],
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
            ServiceFooter()
          ]),
        ),
      );}
    );
  }
}
