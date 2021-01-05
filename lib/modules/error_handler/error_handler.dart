import 'package:flutter/material.dart';

class ErrorHandler {
  static errorHandler(BuildContext context, String error) {
    switch (error) {
      case "userExistException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("이미 가입된 회원이에요.\n이메일을 다시 확인해주세요."),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
        break;

      case "SplashException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("어플리케이션 실행에 오류가 발생했어요.\n잠시뒤에 다시 시도해주세요."),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
        break;

      case "ApiRequestException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("서버와의 통신에 문제가 발생했어요.\n고객센터로 문의 부탁드립니다."),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
        break;

      case "LoginException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("로그인에 실패했어요.\n아이디와 비밀번호를 다시 확인해주세요"),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
        break;

      case "AuthExpiredException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("회원가입 제한시간이 만료되었어요.\n처음부터 다시 진행해주세요"),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.popUntil(
                            context, ModalRoute.withName("/appIntro")),
                        child: Text("확인"))
                  ]);
            });
        break;

      case "UserAddressNameDuplicatedException":
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("같은 이름의 주소가 이미 있어요!\n주소의 이름을 바꿔주세요"),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
        break;

      default:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("확인이 필요해요!"),
                  content: Text("알 수 없는 문제가 발생했어요.\n고객센터로 문의 부탁드립니다."),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("확인"))
                  ]);
            });
    }
  }
}
