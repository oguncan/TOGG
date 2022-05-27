import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';

class FavouriteController extends GetxController {

  RxList<PoiReply> favouritePoiList = <PoiReply>[].obs;

  var routeController = Get.find<RouteController>();

  RxBool favouritePoiListLoading = false.obs;

  RxBool addOrDeleteOperationProgress = false.obs;

  @override
  void onInit() async{
    super.onInit();
    favouritePoiListLoading(true);
    getAllFavouritePoiList();
    favouritePoiListLoading(false);
  }

  getAllFavouritePoiList() async{
    favouritePoiList.addAll(routeController.favouriteServiceRepository.favourite);
  }

  removeFavoritePoiObject(PoiReply poi) async{
    addOrDeleteOperationProgress(true);

    routeController.favouriteServiceRepository.addRemoveFavorite(poi);
    favouritePoiList.clear();
    favouritePoiList.addAll(routeController.favouriteServiceRepository.favourite);

    addOrDeleteOperationProgress(false);
  }






}