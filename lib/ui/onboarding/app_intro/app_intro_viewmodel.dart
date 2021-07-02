import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppIntroViewModel {
  void onPressStart() {
    Get.toNamed("/userAccount");
  }

  void onPressLogin() {
    Get.toNamed("/userLogin");
  }

  Map<String, String> generateInformation(int index) {
    const itemArray = [
      {
        "mainTitleNormal": "구독의 바다를 섭핑!",
        "subTitleAccent": " 구독에 대한 정보부터 구매 ,관리까지 한 번에!\n간단한 구독 생활을 즐겨보세요",
        "illustImage": "assets/appIntro1.png"
      },
      {
        "mainTitleNormal": "한 번에 관리하니까 섭핑!",
        "subTitleAccent": "여기저기 흩어진 구독 서비스들,이젠 섭핑에서 한번에 관리하세요",
        "illustImage": "assets/appIntro2.png"
      },
      {
        "mainTitleNormal": "알아서 추천해주니까,",
        "subTitleAccent": " 인공지능이 사용자님의 취향을 기반으로\n좋아할 만한 상품을 추천해 줄거에요!",
        "illustImage": "assets/appIntro3.png"
      },
    ];

    return itemArray[index];
  }
}
