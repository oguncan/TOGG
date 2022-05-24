import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';


class RouteBinding extends Bindings{
  @override
  void dependencies() {
    //Controller
    Get.lazyPut<RouteController>(() => RouteController());
  }

}