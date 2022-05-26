import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';

class HomeController extends GetxController {

  var routeController = Get.find<RouteController>();

  RxList<PoiReply> poiReplyList = <PoiReply>[].obs;

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
    poiListLoading(true);
    getAllPoiValues();
    poiListLoading(false);
  }

  getAllPoiValues() async{
    routeController.poiServiceRepository.getPois().listen((event){
      poiReplyList.add(event);
      allMarkers.add(Marker(
        markerId: MarkerId(event.id.toString()),
        position: LatLng(event.lat, event.lon),
        infoWindow: InfoWindow(title: event.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }, onError: (error) async{
      if ((error as GrpcError).code == 16) {
        routeController.dataSource.setToken("");
        Get.toNamed('/login');
      }
    }, onDone: () async{
      initialCameraPosition.value = CameraPosition(
          target: LatLng(poiReplyList[0].lat, poiReplyList[0].lon),
          zoom: 8
      );
    });
  }

  void addMaker(LatLng position){
    poiListLoading(true);
    if(origin.value != null || (origin.value != null && destination.value != null)){
      origin.value = Marker(
        markerId: MarkerId("origin"),
        infoWindow: InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: position
      );
      destination.value = null;
    }
    else{
      destination.value = Marker(
          markerId: MarkerId("destination"),
          infoWindow: InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position
      );
    }
    poiListLoading(false);
    update();
  }




}