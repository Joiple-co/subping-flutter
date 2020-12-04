import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/textfield/widthfit_textfield.dart';
import 'package:subping/ui/onboarding/app_intro/app_intro_viewmodel.dart';

class AppIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = AppIntroViewModel();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HeaderSafe(
        child: Column(
          children: [
            Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  var information = viewModel.generateInformation(index);

                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(information["illustImage"]),
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text.rich(
                            TextSpan(
                                text: information["mainTitleNormal"],
                                children: [
                                  TextSpan(
                                      text: information["mainTitleAccent"],
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(0, 224, 197, 1)))
                                ]),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          information["subTitle"],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 4,
                loop: false,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Theme.of(context).disabledColor,
                        activeColor: Theme.of(context).primaryColor,
                        size: 5,
                        activeSize: 5)),
              ),
            ),
            SizedBox(height: 10),
            SqaureButton(
                text: "지금 섭핑 시작하기",
                onPressed: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    context: context,
                    builder: (BuildContext context) => Container(
                        height: 170,
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            SqaureButton(
                                text: "지금 가입하고 사용할래요!",
                                onPressed: () =>
                                    viewModel.onPressStart(context)),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () => viewModel.onPressLogin(context),
                                child: Text("이미 회원이에요. 로그인할래요!",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).primaryColor))),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => viewModel.onPressLater(context),
                              child: Text("우선은 둘러볼래요."),
                            ),
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}
