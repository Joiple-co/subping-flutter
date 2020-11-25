import 'amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subping/ui/design_system/transition/circlular_reveal_transition.dart';
import 'package:subping/ui/onboarding/app_intro/app_intro.dart';
import 'package:subping/ui/onboarding/user_detailed_information/user_detailed_information.dart';
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
    return MaterialApp(
      title: "subping",
      theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 224, 197, 1),
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          indicatorColor: Color.fromRGBO(0, 224, 197, 1),
          disabledColor: Color.fromRGBO(224, 224, 224, 1)),
      initialRoute: "/splash",
      routes: {
        "/splash": (BuildContext context) => Splash(),
        "/userInformation": (BuildContext context) => UserDetailedInformation()
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        switch (settings.name) {
          case "/appIntro":
            return CirclularRevealTransition(
                page: AppIntro(),
                maxRadius: 2000,
                centerAlignment: Alignment.center,
                transitionDuration: Duration(milliseconds: 1000));
        }
      },
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AppIntro());
  }
}
