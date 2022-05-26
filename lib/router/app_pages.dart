import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/pages.dart';
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
      name: AppRoutes.Favorite,
      middlewares: [MyMiddleWare()],
      page: () => FavoriteScreen(),
      binding: FavoriteBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
  ];

}

class MyMiddleWare extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}