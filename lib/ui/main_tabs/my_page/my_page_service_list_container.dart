import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageServiceListContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40.w, 30.h, 40.w, 30.h),
      color: SubpingColor.white100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubpingText(
            "상품 및 서비스",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "구독상품 관리",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "정기배송 상품관리",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "구독 해지 상품 조회",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large30),
          SubpingDivider(),          
          Space(size: SubpingSize.large30),
          SubpingText(
            "결제 정보 및 보안 관리",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "등록 카드",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "등록 은행",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
              //fontWeight : SubpingFontWeight.bold
            ),
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "장금 및 보안",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large30),
          SubpingDivider(),
          Space(size: SubpingSize.large30),
          SubpingText(
            "공지사항",
            size: SubpingFontSize.body5,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "이용약관",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "개인정보처리방침",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
          Space(size: SubpingSize.large30),
          SubpingDivider(),
          Space(size: SubpingSize.large30),
          SubpingText(
            "고객센터",
            size: SubpingFontSize.body1,
            color: SubpingColor.black60,
          ),
          Space(size: SubpingSize.large40),
          GestureDetector(
            child: SubpingText(
              "앱 문의 및 건의",
              size: SubpingFontSize.body1,
              color: SubpingColor.black100,
            ),
          ),
        ],
      ),
    );
  }
}
