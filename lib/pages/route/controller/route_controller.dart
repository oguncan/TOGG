import 'package:get/get.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/src/generated/poi.dart';

class RouteController extends GetxController {

  var isLoadWelcomePage = true.obs;

  ///REPOSITORY
  AuthService authServiceRepository = AuthService();
  FavoriteService favoriteServiceRepository = FavoriteService();
  PoiService poiServiceRepository = PoiService();


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