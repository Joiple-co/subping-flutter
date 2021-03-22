import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subping/ui/onboarding/app_intro/app_intro.dart';
import 'package:flutter_screenutil/screenutil.dart';

void main() => runApp(SubpingApp());

class SubpingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        allowFontScaling: true,
        child: MaterialApp(
            title: 'subping',
            theme: ThemeData(
                fontFamily: 'NotoSansKR',
                backgroundColor: Colors.white,
                primaryColor: Color.fromRGBO(80, 110, 225, 1),
                disabledColor: Color.fromARGB(1, 250, 60, 90)),
            home: Scaffold(backgroundColor: Colors.blue),
            initialRoute: '/appIntro',
            routes: {'/appIntro': (BuildContext context) => AppIntro()}));
  }
}
