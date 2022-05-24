import 'package:get/get.dart';

class RouteController extends GetxController {

  var isLoadWelcomePage = true.obs;

  @override
  void onInit() async{
    super.onInit();

  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  Future startCountdownTimer() async {
    // if(Application.backendSettings != null) {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      isLoadWelcomePage.value = false;
      Get.toNamed('/login');
    });
  }

}