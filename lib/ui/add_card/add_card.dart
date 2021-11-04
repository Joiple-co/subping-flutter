import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:lottie/lottie.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';
import 'package:subping/viewmodel/local/add_card/add_card_viewmodel.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addCardViewModel = Get.find<AddCardViewModel>();

    return Obx(() {
      if (addCardViewModel.step == AddCardStep.CARD_NAME) {
        return CardName();
      } else if (addCardViewModel.step == AddCardStep.PG) {
        return IamportAssign();
      } else if (addCardViewModel.step == AddCardStep.LOADING) {
        return Loading();
      } else {
        return Done();
      }
    });
  }
}

class CardName extends StatelessWidget {
  const CardName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addCardViewModel = Get.find<AddCardViewModel>();

    return Obx(
      () => Scaffold(
        backgroundColor: SubpingColor.white100,
        appBar: TitleAppBar(
          "카드 등록",
          hasBackButton: true,
        ),
        body: HorizontalPadding(
          child: HeaderSafe(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(SubpingTextSpan(children: [
                      SubpingTextSpan(
                          text: "새로 등록하실 카드의\n",
                          fontSize: SubpingFontSize.title4,
                          fontWeight: SubpingFontWeight.bold),
                      SubpingTextSpan(
                          text: "별칭",
                          fontSize: SubpingFontSize.title4,
                          fontWeight: SubpingFontWeight.bold,
                          color: SubpingColor.subping100),
                      SubpingTextSpan(
                          text: "을 알려주세요!",
                          fontSize: SubpingFontSize.title4,
                          fontWeight: SubpingFontWeight.bold),
                    ])),
                    Space(
                      size: SubpingSize.large32,
                    ),
                    SubpingTextField(
                      hintText: "카드 별칭",
                      onChanged: addCardViewModel.onChangeCardName,
                      helperText: "카드 별칭은 한국어, 영어, 숫자만 입력이 가능합니다",
                      maxLines: 1,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[ㄱ-ㅎ 가-힣 a-z A-Z 0-9]')),
                        FilteringTextInputFormatter.deny(" ")
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    SquareButton(
                      text: "다음",
                      onPressed: addCardViewModel.onClickCardNameDone,
                      disabled: !addCardViewModel.available,
                    ),
                    Space(
                      size: SubpingSize.large20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IamportAssign extends StatelessWidget {
  const IamportAssign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addCardViewModel = Get.find<AddCardViewModel>();
    final userViewModel = Get.find<UserViewModel>();
    final userName = userViewModel.name;
    final userPhoneNumber = userViewModel.phoneNumber;
    final userEmail = userViewModel.email;

    return IamportPayment(
      appBar: TitleAppBar(
        "카드 등록",
        hasBackButton: true,
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      userCode: 'imp90315868',
      data: PaymentData(
        payMethod: 'card',
        name: '구독의 모든것! 섭핑',
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
        amount: 0,
        customerUid: "$userEmail-${UUID.getUUID()}",
        buyerName: userName,
        buyerTel: userPhoneNumber,
        buyerEmail: userEmail,
        appScheme: 'subping',
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        print(result);
        addCardViewModel.onAddCardDone(result);
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();

    return Obx(
      () => Scaffold(
          backgroundColor: SubpingColor.white100,
          appBar: TitleAppBar(
            "카드 등록",
          ),
          body: Center(
            child: Column(
              children: [
                Lottie.asset("assets/lottie/card_loading.json", height: 300),
                Space(size: SubpingSize.large20),
                SubpingText(
                  "${userViewModel.name}님의 카드를 등록하고 있어요!",
                  textAlign: TextAlign.center,
                  size: SubpingFontSize.title5,
                ),
                SubpingText(
                  "섭핑은 고객님의 카드번호, 유효기간 등의\n민감정보를 저장하지 않습니다.",
                  textAlign: TextAlign.center,
                  size: SubpingFontSize.body2,
                ),
              ],
            ),
          )),
    );
  }
}

class Done extends StatelessWidget {
  const Done({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
