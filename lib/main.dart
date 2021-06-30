import 'package:flutter/material.dart';

import 'package:subping/amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subping/ui/onboarding/app_intro/app_intro.dart';

void main() => runApp(SubpingApp());

class SubpingApp extends StatefulWidget {
  const SubpingApp() : super();

  @override
  _SubpingAppState createState() => _SubpingAppState();
}

class _SubpingAppState extends State<SubpingApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyAPI apiPlugin = AmplifyAPI();

    Amplify.addPlugin(authPlugin);
    Amplify.addPlugin(apiPlugin);

    try {
      await Amplify.configure(getAmplifyCongig("dev"));
    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

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
                disabledColor: Color.fromARGB(1, 250, 60, 90),
                canvasColor: Colors.transparent),
            home: Scaffold(backgroundColor: Colors.blue),
            initialRoute: '/appIntro',
            routes: {'/appIntro': (BuildContext context) => AppIntro()}));
  }
}
