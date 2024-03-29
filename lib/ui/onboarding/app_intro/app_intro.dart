import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:subping/viewmodel/local/onboarding/app_intro_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class AppIntro extends StatelessWidget {
  final appIntroViewModal = AppIntroViewModel();

  AppIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HeaderSafe(
        child: HeaderPadding(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40.w, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubpingText("구독의 바다를 섭핑!",
                        size: SubpingFontSize.title2,
                        color: SubpingColor.subping100,
                        fontWeight: SubpingFontWeight.bold),
                    Container(height: 10),
                    const Text("구독에 대한 정보부터 구매, 관리까지 한번에!\n간단한 구독 생활을 즐겨보세요!",
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Expanded(
                child: Swiper(
                  itemCount: 3,
                  loop: false,
                  viewportFraction: 0.87,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.only(
                            top: 10, left: 30.w, right: 30.w, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(-0.2, -1))
                            ]));
                  },
                ),
              ),
              Container(
                height: 50.h,
              ),
              Center(
                  child: SquareButton(
                      text: "섭핑 시작하기",
                      onPressed: () => showBottomSheet(context))),
              Space(
                size: SubpingSize.large20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              children: [
                SquareButton(
                  text: "지금 가입하고 사용할래요",
                  onPressed: () => appIntroViewModal.onPressStart(),
                ),
                TextButton(
                    onPressed: () => appIntroViewModal.onPressLogin(),
                    child: const Text.rich(TextSpan(
                        text: "이미 회원이에요.",
                        style: TextStyle(fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: "로그인 ",
                              style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                            text: "할래요",
                            style: TextStyle(fontSize: 15),
                          )
                        ])))
              ],
            ),
          );
        });
  }
}
