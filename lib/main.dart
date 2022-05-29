import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:huawei_push/huawei_push.dart' as HuaweiPush;
import 'package:intl/date_symbol_data_local.dart';
import 'package:togg/application.dart';
import 'package:togg/common/common.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/locator.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/router/router.dart';
import 'src/generated/poi.dart';

void main() async{
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    HttpOverrides.global = MyHttpOverrides();
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await initializeDateFormatting('tr_TR', null);
    setupLocator();
    Application.init().then((e) => runApp(MyApp()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(// navigation bar color
      statusBarColor: AppColors.fullBlack, // status bar color
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RouteBinding(),
      title: 'TOGG',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primaryColor: AppColors.fullBlack,
        brightness: Brightness.light,
      ),
      enableLog: true,
      initialRoute: LocalDataSource.instance.token == null ? "login" : "/home",
      getPages: AppPages.routes,
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],

    );
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(scaffoldBackgroundColor: AppColors.fullBlack);
  }
}