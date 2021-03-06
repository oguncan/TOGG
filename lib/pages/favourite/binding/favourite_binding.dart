import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';


class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    //Controller
    Get.lazyPut<RouteController>(() => RouteController());
    Get.lazyPut<FavouriteController>(() => FavouriteController());
  }

}