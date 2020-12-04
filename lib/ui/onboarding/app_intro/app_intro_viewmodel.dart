import 'package:flutter/material.dart';
import 'package:subping/modules/cognito/cognito.dart';

class AppIntroViewModel {
  void onPressStart(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, "/userAccount");
  }

  void onPressLogin(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, "/login");
  }

  void onPressLater(BuildContext context) async {
    final cognito = Cognito();
    cognito.signOut();
  }

  Map<String, String> generateInformation(int index) {
    const itemArray = [
      {
        "mainTitleNormal": "하나로 모아보니까,",
        "mainTitleAccent": " 섭핑!",
        "subTitle": "이제 여기저기 검색은 그만!\n섭핑에서 구독서비스를 간단하게 구독하세요.",
        "illustImage": "assets/appIntro1.png"
      },
      {
        "mainTitleNormal": "한번에 관리하니까,",
        "mainTitleAccent": " 섭핑!",
        "subTitle": "여기저기 흩어진 구독서비스들,\n이젠 섭핑에서 한번에 관리하세요.",
        "illustImage": "assets/appIntro2.png"
      },
      {
        "mainTitleNormal": "알아서 추천해주니까,",
        "mainTitleAccent": " 섭핑!",
        "subTitle": "인공지능이 사용자님의 취향을 기반으로\n좋아할만한 상품을 추천해줄 거에요!",
        "illustImage": "assets/appIntro3.png"
      },
      {
        "mainTitleNormal": "알아서 추천해주니까,",
        "mainTitleAccent": " 섭핑!",
        "subTitle": "어려운 해지는 이제 그만!\n이젠 원터치로 간편하게 해지하세요.!",
        "illustImage": "assets/appIntro4.png"
      }
    ];

    return itemArray[index];
  }
}
