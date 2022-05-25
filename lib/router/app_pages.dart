import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/pages.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Login;

  static final routes = [
    GetPage(
      name: AppRoutes.Route,
      page: () => RouteScreen(),
      binding: RouteBinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Favorite,
      page: () => FavoriteScreen(),
      binding: FavoriteBinding(),
    ),
  ];

}