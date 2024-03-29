// ignore_for_file: prefer_const_constructors

import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:subping/amplifyconfiguration.dart';
import 'package:subping/binding/add_card_bindings.dart';
import 'package:subping/binding/app_intro_bindings.dart';
import 'package:subping/binding/like_service_bindings.dart';
import 'package:subping/binding/onboarding/create_nickname_bindings.dart';
import 'package:subping/binding/search_bindings.dart';
import 'package:subping/binding/start_subscribe_bindings.dart';
import 'package:subping/binding/write_review_bindings.dart';
import 'package:subping/hive/recent_service.dart';
import 'package:subping/main.mapper.g.dart';

import 'package:subping/middleware/alarm_page_middleware.dart';
import 'package:subping/middleware/like_service_middleware.dart';
import 'package:subping/middleware/service_detail_middleware.dart';
import 'package:subping/notifications.dart';
import 'package:subping/ui/add_address/add_address.dart';
import 'package:subping/ui/add_card/add_card.dart';
import 'package:subping/ui/address_management/address_management.dart';
import 'package:subping/ui/card_management/card_management.dart';
import 'package:subping/ui/edit_address/edit_address.dart';

import 'package:subping/ui/hot_chart/hot_chart.dart';
import 'package:subping/ui/like_service/like_service.dart';
import 'package:subping/ui/main_tabs/main_tabs.dart';
import 'package:subping/ui/onboarding/app_intro/app_intro.dart';
import 'package:subping/ui/onboarding/pass_auth/pass_auth.dart';
import 'package:subping/ui/onboarding/user_account/user_account.dart';
import 'package:subping/ui/onboarding/user_login/user_login.dart';
import 'package:subping/ui/onboarding/user_nickname/create_nickname.dart';
import 'package:subping/ui/recent_service_history/recent_service_history.dart';
import 'package:subping/ui/service_datail/service_detail.dart';
import 'package:subping/ui/splash/splash.dart';
import 'package:subping/ui/alarm/alarm.dart';
import 'package:subping/ui/start_subscribe/start_subscribe.dart';
import 'package:subping/ui/write_review/write_review.dart';
import 'package:subping/ui/search/search.dart';
import 'package:subping/ui/subscribe_detail_manage/subscribe_detail_manage.dart';

import 'package:subping/binding/main_tabs_bindings.dart';
import 'package:subping/binding/onboarding/user_account_bindings.dart';
import 'package:subping/binding/onboarding/user_login_bindings.dart';
import 'package:subping/binding/onboarding/pass_auth_bindings.dart';
import 'package:subping/binding/subscribe_detail_manage_bindings.dart';

void main() async {
  initializeJsonMapper();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // NotificationHandler _notificationHandler = NotificationHandler();

  try {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
  await GetStorage.init();

  await Hive.initFlutter();
  Hive.registerAdapter(RecentServiceAdapter());
  await Hive.openBox<RecentService>("recentView");

  SentryFlutter.init((options) {
    options.dsn =
        'https://96c995252e6c4076a07d0748c8c8bb3c@o1070181.ingest.sentry.io/6065812';
  }, appRunner: () => runApp(SubpingApp()));
}

class SubpingApp extends StatefulWidget {
  const SubpingApp({Key key}) : super(key: key);

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
    AmplifyStorageS3 s3Plugin = AmplifyStorageS3();
    AmplifyAnalyticsPinpoint pinpointPlugin = AmplifyAnalyticsPinpoint();

    await Amplify.addPlugin(authPlugin);
    await Amplify.addPlugin(apiPlugin);
    await Amplify.addPlugin(s3Plugin);
    await Amplify.addPlugin(pinpointPlugin);

    try {
      await Amplify.configure(getAmplifyCongig("dev"));
    } on AmplifyAlreadyConfiguredException {
      // ignore: avoid_print
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        builder: () => GetMaterialApp(
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
                GetPage(
                    name: "/appIntro",
                    page: () => AppIntro(),
                    binding: AppIntroBindings()),
                GetPage(
                    name: "/userAccount",
                    page: () => UserAccount(),
                    binding: UserAccuntBindings()),
                GetPage(
                    name: "/passAuth",
                    page: () => PassAuth(),
                    binding: PassAuthBindings()),
                GetPage(
                    name: "/userLogin",
                    page: () => UserLogin(),
                    binding: UserLoginBindings()),
                GetPage(
                    name: "/createNickName",
                    page: () => CreateNickName(),
                    binding: CreateNickNameBindings()),
                GetPage(
                  name: "/addAddress",
                  page: () => AddAddress(),
                ),
                GetPage(
                    name: "/mainTabs",
                    page: () => MainTabs(),
                    binding: MainTabsBindings()),
                GetPage(name: "/hotChart", page: () => HotChart()),
                GetPage(
                    name: "/alarm",
                    page: () => Alarm(),
                    middlewares: [AlarmMiddleWare()]),
                GetPage(
                    name: "/serviceDetail/:param",
                    page: () => ServiceDetail(),
                    middlewares: [ServiceDetailMiddleWare()]),
                GetPage(
                    name: "/writeReview",
                    page: () => WriteReview(),
                    binding: WriteReviewBindings()),
                GetPage(
                    name: "/likeService",
                    page: () => LikeService(),
                    binding: LikeServiceBindings(),
                    middlewares: [LikeServiceMiddleware()]),
                GetPage(
                    name: "/startSubscribe/:param",
                    page: () => StartSubscribe(),
                    binding: StartSubscribeBindings()),
                GetPage(
                  name: "/editAddress/:param",
                  page: () => EditAddress(),
                ),
                GetPage(
                    name: "/search",
                    page: () => Search(),
                    binding: SearchBinidings()),
                GetPage(
                    name: "/addCard",
                    page: () => AddCard(),
                    binding: AddCardBindings()),
                GetPage(name: "/cardManagement", page: () => CardManagement()),
                GetPage(
                    name: "/addressManagement",
                    page: () => AddressManagement()),
                GetPage(
                    name: "/recentServiceHistory",
                    page: () => RecentServiceHistory()),
                GetPage(
                    name: "/subsctribeDetailManage/:param",
                    page: () => SubscribeDetailManage(),
                    binding: SubscribeDetailManageBindings())
              ],
            ));
  }
}
