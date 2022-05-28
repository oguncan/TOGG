import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';

class HomeController extends GetxController {

  var routeController = Get.find<RouteController>();

  RxList<PoiReply> poiReplyList = <PoiReply>[].obs;
  RxList<PoiReply> favouritePoiList = <PoiReply>[].obs;

  RxBool poiListLoading = false.obs;

  late GoogleMapController googleMapController;

  RxList<Marker> allMarkers = <Marker>[].obs;

  Rx<CameraPosition> initialCameraPosition = CameraPosition(
    target: LatLng(31.110484, 72.384598),
    zoom: 8
  ).obs;

  Rx<Marker?> origin = Marker(
    markerId: MarkerId("origin")
  ).obs;
  Rx<Marker?> destination = Marker(
      markerId: MarkerId("destination")
  ).obs;


  @override
  void onInit() async{
    super.onInit();
    print('XD');
    poiListLoading(true);
    getAllPoiValues();
    getAllFavouritePoiList();
    poiListLoading(false);
  }


  getAllFavouritePoiList() async{
    favouritePoiList.clear();
    favouritePoiList.addAll(routeController.favouriteServiceRepository.favourite);
  }

  bool isThereFavourite(PoiReply poi){
    if(favouritePoiList.contains(poi)){
      return true;
    }
    return false;
  }

  getAllPoiValues() async{
    routeController.poiServiceRepository.getPois().listen((event){
      poiReplyList.add(event);
    }, onError: (error) async{
      if ((error as GrpcError).code == 16) {
        routeController.dataSource.setToken(null);
        Get.offNamed('/login');
      }
    }, onDone: () async{
      animateCameraWithNewPosition();
    });
  }

  animateCameraWithNewPosition(){
    if(poiReplyList.isNotEmpty){
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(poiReplyList[0].lat, poiReplyList[0].lon),
                  zoom: 8
              ))
      );
    }
  }


  addFavoritePoiObject(PoiReply poi) async{
    poiListLoading(true);

    routeController.favouriteServiceRepository.addRemoveFavorite(poi);
    favouritePoiList.clear();
    favouritePoiList.addAll(routeController.favouriteServiceRepository.favourite);

    poiListLoading(false);
  }

  void addMaker(LatLng position){
    poiListLoading(true);
    if (origin.value != null ||
        (origin.value != null && destination.value != null)) {
      origin.value = Marker(
          markerId: MarkerId("origin"),
          infoWindow: InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position,
          onTap: () async {

          });
      destination.value = null;
    } else {
      destination.value = Marker(
          markerId: MarkerId("destination"),
          infoWindow: InfoWindow(title: 'Destination'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position);
    }
    poiListLoading(false);
    update();
  }






}