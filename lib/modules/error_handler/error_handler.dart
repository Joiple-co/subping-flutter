import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class ErrorHandler {
  static errorHandler(String error) {
    print(error);
    
    switch (error) {
      case "UserExistException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("이미 가입된 회원이에요.\n이메일을 다시 확인해주세요."),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "UserAccountException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("회원가입에 문제가 있어요.\n정보를 확인해주세요."),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;

      case "SplashException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("어플리케이션 실행에 오류가 발생했어요.\n잠시뒤에 다시 시도해주세요."),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;

      case "ApiRequestException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("서버와의 통신에 문제가 발생했어요.\n고객센터로 문의 부탁드립니다."),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;

      case "LoginException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("로그인에 실패했어요.\n아이디와 비밀번호를 다시 확인해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;

      case "AuthExpiredException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("회원가입 제한시간이 만료되었어요.\n처음부터 다시 진행해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.offNamed("/appIntro"),
                  child: SubpingText("확인"))
            ]));
        break;

      case "UserAddressNameDuplicatedException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("같은 이름의 주소가 이미 있어요!\n주소의 이름을 바꿔주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "GetUserException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("유저 정보를 가져오는데 실패했어요.\n잠시뒤에 다시 시도해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "NickNameDuplicateException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("닉네임 중복 여부를 확인하넨데 실패했어요.\n잠시뒤에 다시 시도해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "NickNameUpdateException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("닉네임 업데이트에 실패했어요.\n잠시뒤에 다시 시도해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "AddCardException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("카드 등록에 실패했어요.\n잠시뒤에 다시 시도해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;
      
      case "EditUserAddressException":
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("주소 수정에 실패했어요.\n잠시뒤에 다시 시도해주세요"),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
        break;

      default:
        Get.dialog(AlertDialog(
            title: Text("확인이 필요해요!"),
            content: Text("알 수 없는 문제가 발생했어요.\n고객센터로 문의 부탁드립니다."),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: SubpingText("확인", size: SubpingFontSize.body1, color: SubpingColor.subping100))
            ]));
    }
  }
}
