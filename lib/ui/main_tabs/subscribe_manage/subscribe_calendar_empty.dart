import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/helper/helper.dart';
import 'package:subping/ui/main_tabs/subscribe_manage/timeline_status.dart';
import 'package:subping/viewmodel/local/main_tabs/main_tabs_viewmodel.dart';

class SubscribeCalendarEmpty extends StatelessWidget {
  const SubscribeCalendarEmpty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainTabsViewModel = Get.find<MainTabsViewModel>();

    return Container(
      child: Stack(children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 200, 10, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SubpingText(
                        "${DateTime.now().day}일",
                        size: SubpingFontSize.title5,
                        fontWeight: SubpingFontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: SubpingColor.back20,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        "https://media-exp1.licdn.com/dms/image/C4E0BAQEVb0ZISWk8vQ/company-logo_200_200/0/1519896425167?e=2159024400&v=beta&t=mtbBYcyzfcDB7Seolq93YaKMruv36fIUCYMcI9g5itk",
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Space(size: SubpingSize.tiny5),
                                    SubpingText("섭핑",
                                        size: SubpingFontSize.title6)
                                  ],
                                ),
                                TimeLineStatus(
                                  status: "결제 완료",
                                )
                              ],
                            ),
                            Space(size: SubpingSize.medium14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SubpingText(
                                          "편안한 구독생활",
                                          size: SubpingFontSize.body1,
                                          color: SubpingColor.black80,
                                        ),
                                      ),
                                      Space(
                                        size: SubpingSize.large20,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 25,
                                          color: SubpingColor.black30),
                                      Space(
                                        size: SubpingSize.large20,
                                      )
                                    ],
                                  ),
                                ),
                                SubpingText(
                                  "${Helper.setComma(0)}원",
                                  size: SubpingFontSize.body1,
                                  fontWeight: SubpingFontWeight.bold,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Space(
                        size: SubpingSize.medium10,
                      )
                    ]),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: SubpingText(
                        "${DateTime.now().add(Duration(days: 1)).day}일",
                        size: SubpingFontSize.title5,
                        fontWeight: SubpingFontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: SubpingColor.back20,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        "https://media-exp1.licdn.com/dms/image/C4E0BAQEVb0ZISWk8vQ/company-logo_200_200/0/1519896425167?e=2159024400&v=beta&t=mtbBYcyzfcDB7Seolq93YaKMruv36fIUCYMcI9g5itk",
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Space(size: SubpingSize.tiny5),
                                    SubpingText("섭핑",
                                        size: SubpingFontSize.title6)
                                  ],
                                ),
                                TimeLineStatus(
                                  status: "결제 예정",
                                )
                              ],
                            ),
                            Space(size: SubpingSize.medium14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SubpingText(
                                          "스마트한 구독관리",
                                          size: SubpingFontSize.body1,
                                          color: SubpingColor.black80,
                                        ),
                                      ),
                                      Space(
                                        size: SubpingSize.large20,
                                      ),
                                      Container(
                                          width: 2,
                                          height: 25,
                                          color: SubpingColor.black30),
                                      Space(
                                        size: SubpingSize.large20,
                                      )
                                    ],
                                  ),
                                ),
                                SubpingText(
                                  "${Helper.setComma(0)}원",
                                  size: SubpingFontSize.body1,
                                  fontWeight: SubpingFontWeight.bold,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Space(
                        size: SubpingSize.medium10,
                      )
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.11),
                    Color.fromRGBO(233, 233, 233, 0.12),
                    Color.fromRGBO(77, 77, 77, 0.15),
                    Color.fromRGBO(0, 0, 0, 0.3),
                  ],
                  stops: [
                    0.0,
                    0.1,
                    0.2,
                    1.0
                  ])),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                color: SubpingColor.back20,
              ),
              Space(size: SubpingSize.medium10),
              HorizontalPadding(
                child: SubpingText(
                  "구독중인 서비스가 없어요 😢\n섭핑에서 구독하고 한 번에 관리하세요!",
                  size: SubpingFontSize.title6,
                ),
              ),
              Space(size: SubpingSize.medium10),
              HorizontalPadding(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: SubpingColor.white100),
                  child: SquareButton(
                    text: "구독 가능한 서비스 둘러보기",
                    onPressed: () {
                      mainTabsViewModel.onChangeTabIndex(1);
                    },
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ]),
    );
  }
}
