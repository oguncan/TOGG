import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';

class LoginController extends GetxController {

  GlobalKey<FormState> loginFormKey = new GlobalKey();

  var isAuthenticating = false.obs;

  RxBool isFirstClicked = false.obs;

  TextEditingController loginUsernameTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();

  ///CONTROLLER
  var routeController = Get.find<RouteController>();

  @override
  void onInit() async{
    super.onInit();
    print(routeController.dataSource.token);
  }

  RxBool obscured = true.obs;
  setToggleObscured(){
    obscured.value = !obscured.value;
  }

  Future<bool> login() async {
    isAuthenticating(true);
    try {
      var res = await routeController.authServiceRepository
          .login(LoginRequest(username: loginUsernameTextController.text, password: loginPasswordTextController.text));
      await routeController.dataSource.setToken(res.token);
      print(routeController.dataSource.token);
      routeController.showDynamicToast("Successfully logged in.");
      isAuthenticating(false);
      return true;
    } on GrpcError catch(e) {
      isAuthenticating(false);
      routeController.showDynamicToast("${e.message}");
      isAuthenticating(false);
      return false;
      //throw Exception(e);
    }
  }

  void validateController() async {
    if (loginFormKey.currentState!.validate()) {
      bool isSuccess = await login();
      if(isSuccess){
        Get.offNamed('/home');
      }
    }
  }




}