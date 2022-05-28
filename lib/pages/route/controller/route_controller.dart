import 'package:get/get.dart';
import 'package:togg/common/common.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:togg/src/generated/poi.dart';
import 'package:togg/utils/firebase_analytics_util.dart';

class RouteController extends GetxController {

  var isLoadWelcomePage = true.obs;

  ///REPOSITORY
  AuthService authServiceRepository = AuthService();
  FavouriteService favouriteServiceRepository = FavouriteService();
  PoiService poiServiceRepository = PoiService();

  ///Data Source(Storage)
  LocalDataSource dataSource = LocalDataSource.instance;


  @override
  void onInit() async{
    super.onInit();

  }

  showDynamicToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.toggColor,
        textColor: AppColors.white,
        fontSize: 16.0);
  }

  sendFirebaseEventMessage(String eventMessage, Map<String, String>? parameter){
    FirebaseAnalyticsUtil.instance.event(eventMessage, parameters: parameter);
  }

}