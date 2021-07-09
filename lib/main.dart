import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:subping/amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subping/ui/main_tabs/category/category.dart';
import 'package:subping/ui/main_tabs/main_tabs.dart';
import 'package:subping/ui/onboarding/app_intro/app_intro.dart';
import 'package:subping/ui/onboarding/pass_auth/pass_auth.dart';
import 'package:subping/ui/onboarding/user_account/user_account.dart';
import 'package:subping/ui/onboarding/user_login/user_login.dart';
import 'package:subping/ui/splash/splash.dart';
import 'package:subping/ui/main_tabs/home/home.dart';

import 'package:subping/ui/design_system/subping_ui.dart';

void main() async {
  await GetStorage.init();
  runApp(SubpingApp());
}

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
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        allowFontScaling: true,
        child: GetMaterialApp(
          title: 'subping',
          theme: ThemeData(
              fontFamily: 'NotoSansKR',
              backgroundColor: Colors.white,
              primaryColor: Color.fromRGBO(80, 110, 225, 1),
              disabledColor: Color.fromRGBO(173, 178, 198, 0.5),
              canvasColor: Colors.transparent),
          home: Scaffold(backgroundColor: Colors.blue),
          initialRoute: '/splash',
          getPages: [
            GetPage(name: "/splash", page: () => Splash()),
            GetPage(name: "/appIntro", page: () => AppIntro()),
            GetPage(name: "/userAccount", page: () => UserAccount()),
            GetPage(name: "/passAuth", page: () => PassAuth()),
            GetPage(name: "/userLogin", page: () => UserLogin()),
            GetPage(name: "/mainTabs", page: () => MainTabs()),
          ],
        ));
  }
}
