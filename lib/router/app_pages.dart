import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Route;

  static final routes = [
    GetPage(
        name: AppRoutes.Route,
        page: () => RouteScreen(),
        binding: RouteBinding(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        ),
    GetPage(
      name: AppRoutes.Login,
      middlewares: [MyMiddleWare()],
      page: () => LoginScreen(),
      binding: LoginBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: AppRoutes.Home,
      middlewares: [MyMiddleWare()],
      page: () => HomeScreen(),
      binding: HomeBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      name: AppRoutes.Favourite,
      middlewares: [MyMiddleWare()],
      page: () => FavouriteScreen(),
      binding: FavouriteBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
  ];

}

class MyMiddleWare extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {

    return super.onPageCalled(page);
  }
}