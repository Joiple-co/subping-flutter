import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:subping/ui/design_system/transition/circlular_reveal_transition.dart';
import 'package:subping/ui/main_tabs/main_tabs.dart';
import 'package:subping/ui/onboarding/app_intro/app_intro.dart';
import 'package:subping/ui/onboarding/pass_auth/pass_auth.dart';
import 'package:subping/ui/onboarding/user_account/user_account.dart';
import 'package:subping/ui/onboarding/user_address/user_address.dart';
import 'package:subping/ui/onboarding/user_login/user_login.dart';
import 'package:subping/ui/splash/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(SubpingApp());
}

class SubpingApp extends StatefulWidget {
  @override
  _SubpingAppState createState() => _SubpingAppState();
}

class _SubpingAppState extends State<SubpingApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      allowFontScaling: true,
      child: MaterialApp(
        title: "subping",
        theme: ThemeData(
            fontFamily: "NanumSQR",
            primaryColor: Color.fromRGBO(0, 224, 197, 1),
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            indicatorColor: Color.fromRGBO(0, 224, 197, 1),
            disabledColor: Color.fromRGBO(224, 224, 224, 1)),
        initialRoute: "/splash",
        routes: {
          "/splash": (BuildContext context) => Splash(),
          "/userAccount": (BuildContext context) => UserAccount(),
          "/passAuth": (BuildContext context) => PassAuth(),
          "/login": (BuildContext context) => UserLogin(),
          "/onboardingUserAddress": (BuildContext context) => UserAddress(),
          "/home": (BuildContext context) => MainTabs(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/appIntro":
              return CirclularRevealTransition(
                  name: "/appIntro",
                  page: AppIntro(),
                  maxRadius: 2000,
                  centerAlignment: Alignment.center,
                  transitionDuration: Duration(milliseconds: 1000));
          }
        },
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AppIntro());
  }
}
