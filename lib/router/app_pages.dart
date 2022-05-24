import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/pages.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Route,
      page: () => RouteScreen(),
      binding: RouteBinding(),
    ),
  ];

}