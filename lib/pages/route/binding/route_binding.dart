import 'package:get/get.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/pages/pages.dart';


class RouteBinding extends Bindings{
  @override
  void dependencies() {
    //Controller
    Get.lazyPut<RouteController>(() => RouteController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);

    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => FavoriteService());
    Get.lazyPut(() => PoiService());
    Get.lazyPut(() => LocalDataSource());
  }

}