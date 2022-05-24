import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:huawei_push/huawei_push.dart' as HuaweiPush;
import 'package:intl/date_symbol_data_local.dart';
import 'package:togg/application.dart';
import 'package:togg/common/common.dart';
import 'package:togg/common/langs/translation_service.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/router/router.dart';

import 'src/generated/poi.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();
  await initializeDateFormatting('tr_TR', null);
  Application.init().then((e) => runApp(MyApp()));
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Poi = PoiRequest();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(// navigation bar color
      statusBarColor: AppColors.fullBlack, // status bar color
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RouteBinding(),
      title: 'Murat Lastik Premium',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primaryColor: AppColors.fullBlack,
        brightness: Brightness.light,
      ),
      home: RouteScreen(),
      enableLog: true,
      locale: TranslationService.locale,
      translations: TranslationService(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [],
    );
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(scaffoldBackgroundColor: AppColors.fullBlack);
  }
}