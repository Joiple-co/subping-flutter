import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/subscribe_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_pause_indicator.dart';
import 'package:subping/viewmodel/local/subsctibe_detail_manage/subscribe_detail_manage_viewmodel.dart';

class SubscribePauseBottomSheet extends StatelessWidget {
  final SubscribeModel subscribe;

  const SubscribePauseBottomSheet({Key key, this.subscribe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeDetailManageViewModel =
        Get.find<SubscribeDetailManageViewModel>();

    return Container(
      decoration: BoxDecoration(
          color: SubpingColor.white100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Obx(() {
        final selctedDatetime = Helper.addPeriod(
            subscribe.getNextPaymentDate(), subscribe.period,
            times: subscribeDetailManageViewModel.selcectedPauseTimes);

        return SingleChildScrollView(
          child: HorizontalPadding(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space(size: SubpingSize.medium10),
                SubpingText(
                  "구독 일시정지",
                  size: SubpingFontSize.title5,
                  fontWeight: SubpingFontWeight.medium,
                ),
                SubpingText("구독 정지는 최대 3회 까지 가능합니다.",
                    size: SubpingFontSize.body4, color: SubpingColor.black80),
                Space(
                  size: SubpingSize.medium10,
                ),
                SubscribePauseIndicator(
                  lastDate: subscribe.getLastPaymentDate(),
                  nextDate: selctedDatetime,
                ),
                Space(
                  size: SubpingSize.medium10,
                ),
                SubpingText(
                  "정지 횟수",
                  size: SubpingFontSize.title6,
                  fontWeight: SubpingFontWeight.medium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(SubpingTextSpan(children: [
                      SubpingTextSpan(
                          text: "1회 ", fontSize: SubpingFontSize.title6),
                      SubpingTextSpan(
                          text:
                              "(${Helper.dateTimeToString(Helper.addPeriod(subscribe.getNextPaymentDate(), subscribe.period, times: 1))})",
                          fontSize: SubpingFontSize.body4,
                          color: SubpingColor.black60),
                    ])),
                    Radio(
                        value: 1,
                        groupValue:
                            subscribeDetailManageViewModel.selcectedPauseTimes,
                        onChanged:
                            subscribeDetailManageViewModel.onClickPauseRadio)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(SubpingTextSpan(children: [
                      SubpingTextSpan(
                          text: "2회 ", fontSize: SubpingFontSize.title6),
                      SubpingTextSpan(
                          text:
                              "(${Helper.dateTimeToString(Helper.addPeriod(subscribe.getNextPaymentDate(), subscribe.period, times: 2))})",
                          fontSize: SubpingFontSize.body4,
                          color: SubpingColor.black60),
                    ])),
                    Radio(
                        value: 2,
                        groupValue:
                            subscribeDetailManageViewModel.selcectedPauseTimes,
                        onChanged:
                            subscribeDetailManageViewModel.onClickPauseRadio)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(SubpingTextSpan(children: [
                      SubpingTextSpan(
                          text: "3회 ", fontSize: SubpingFontSize.title6),
                      SubpingTextSpan(
                          text:
                              "(${Helper.dateTimeToString(Helper.addPeriod(subscribe.getNextPaymentDate(), subscribe.period, times: 3))})",
                          fontSize: SubpingFontSize.body4,
                          color: SubpingColor.black60),
                    ])),
                    Radio(
                        value: 3,
                        groupValue:
                            subscribeDetailManageViewModel.selcectedPauseTimes,
                        onChanged:
                            subscribeDetailManageViewModel.onClickPauseRadio)
                  ],
                ),
                Space(
                  size: SubpingSize.large20,
                ),
                SquareButton(
                    loading:
                        subscribeDetailManageViewModel.isSubscribePauseLoading,
                    text:
                        "${(selctedDatetime.month < 10 ? "0" : "") + selctedDatetime.month.toString()}월 ${(selctedDatetime.day < 10 ? "0" : "") + selctedDatetime.day.toString()}일에 구독 재시작하기",
                    onPressed: () =>
                        subscribeDetailManageViewModel.updatePauseSubscribe(
                            subscribe.serviceId, subscribe.id)),
                Space(
                  size: SubpingSize.large20,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
