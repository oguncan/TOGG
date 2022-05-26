import 'package:get/get.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/pages/pages.dart';


class RouteBinding extends Bindings{
  @override
  void dependencies() {
    //Controller
    Get.lazyPut<RouteController>(() => RouteController());

    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => FavoriteService());
    Get.lazyPut(() => PoiService());
  }

}