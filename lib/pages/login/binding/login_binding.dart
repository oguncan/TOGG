import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';


class LoginBinding extends Bindings{
  @override
  void dependencies() {
    //Controller
    Get.lazyPut<RouteController>(() => RouteController());
    Get.lazyPut<LoginController>(() => LoginController());
  }

}