import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ServiceDetail extends StatelessWidget {
  final ServiceModel service;

  ServiceDetail({this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        service.name,
        hasBackButton: true,
      ),
      body: ListView(children: [
        HeaderSafe(
          child: Column(
            children: [
              Image.network(service.serviceLogoUrl,
                  width: 828.h, height: 828.h, fit: BoxFit.fill),
              HorizontalPadding(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space(size: SubpingSize.large30),
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
                        size: SubpingSize.medium20,
                      ),
                      SubpingText(service.summary),
                      Space(size: SubpingSize.large40),
                      SubpingText("9,000원 ~", size: SubpingFontSize.title6, fontWeight: SubpingFontWeight.bold,),
                      Space(size: SubpingSize.large40),
                      Divider(),
                      Space(size: SubpingSize.large30,),
                      Row(children: [
                        SubpingText("카테고리", color: SubpingColor.black60),
                        Space(size: SubpingSize.large50,),
                        SubpingText(service.category.join(","))
                      ],),
                      Space(size: SubpingSize.large30,),
                      Divider(),
                      Space(size: SubpingSize.large30,),
                      Row(children: [
                        SubpingText("제품설명", color: SubpingColor.black60),
                        Space(size: SubpingSize.large50,),
                        Wrap(children: [
                          SubpingText(service.summary, size: null,)
                        ])
                      ],),
                    ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
