import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/const/const.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/viewmodel/local/subscribe/start_subscribe_viewmodel.dart';

class SubscribePeriod extends StatelessWidget {
  final ServiceModel service;
  final StartSubscribeViewModel startSubscribeViewModel;

  const SubscribePeriod({Key key, this.startSubscribeViewModel, this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(
            size: SubpingSize.medium14,
          ),
          SubpingText(
            "구독 주기",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          ),
          SubpingText(
            "얼마나 자주 구독할지 선택할 수 있어요.\n주기는 구독 이후에도 변경이 가능해요!",
            size: SubpingFontSize.body4,
            color: SubpingColor.black80,
          ),
          Space(
            size: SubpingSize.medium14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubpingText("선택된 주기", size: SubpingFontSize.body1),
                  SubpingText(
                      periodString[startSubscribeViewModel.selectedPeriod],
                      size: SubpingFontSize.body1),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubpingText("다음 구독 예정일", size: SubpingFontSize.body1),
                  SubpingText(
                      Helper.dateTimeToString(Helper.addPeriod(DateTime.now(),
                          startSubscribeViewModel.selectedPeriod)),
                      size: SubpingFontSize.body1),
                ],
              ),
            ],
          ),
          Space(
            size: SubpingSize.large20,
          ),
          SquareButton(
              text: "주기 변겅하기",
              onPressed: () => Get.bottomSheet(
                    Obx(
                      () => Wrap(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: SubpingColor.white100,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Space(
                                  size: SubpingSize.medium14,
                                ),
                                SubpingText(
                                  "구독 주기",
                                  size: SubpingFontSize.title6,
                                  fontWeight: SubpingFontWeight.bold,
                                ),
                                SubpingText(
                                  "얼마나 자주 구독할지 선택할 수 있어요.\n주기는 구독 이후에도 변경이 가능해요!",
                                  size: SubpingFontSize.body4,
                                  color: SubpingColor.black80,
                                ),
                                Space(
                                  size: SubpingSize.medium14,
                                ),
                                PeriodRadioSelector(
                                  period: service.period,
                                  value: startSubscribeViewModel.selectedPeriod,
                                  onChangeValue: (value) {
                                    startSubscribeViewModel
                                        .onSelectPeriod(value);
                                    Get.back();
                                  },
                                ),
                                Space(
                                  size: SubpingSize.large32,
                                )
                              ]),
                        ),
                      ]),
                    ),
                  ),
              type: "outline"),
          Space(
            size: SubpingSize.medium14,
          ),
        ],
      ),
    );
  }
}
