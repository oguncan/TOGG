import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:togg/common/common.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';
import 'package:togg/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.toggColor
              ),
              child: Text("Favourites", style: CustomTextStyle.smallText(context).copyWith(
                color: AppColors.white
              )),
              onPressed: () async{
                var result = await Get.toNamed('/favourite');
                await controller.getAllFavouritePoiList();
              },
            ),
            body: Obx(() => AbsorbPointer(
            absorbing: controller.poiListLoading.isTrue ? true : false,
            child: Opacity(
              opacity: controller.poiListLoading.value ? 0.2 : 1,
              child: Stack(
                children: [
                  Obx(() => controller.poiListLoading.value ? Container(width:0, height: 0) : GoogleMap(
                    initialCameraPosition: controller.initialCameraPosition.value,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    onMapCreated: (cont) {
                      controller.googleMapController = cont;
                    },
                    markers: controller.poiReplyList.map((poi){
                      return Marker(
                        markerId: MarkerId(poi.id.toString()),
                        position: LatLng(poi.lat, poi.lon),
                        onTap: (){
                          showMarkDetailWidget(context, poi);
                        },
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      );
                    }).toSet(),
                  )),
                  if(controller.poiListLoading.isTrue)
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Loading.."
                          ),
                          SizedBox(width: 8),
                          CircularProgressIndicator()
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),)
        ),
      );
    });
  }

  void showMarkDetailWidget(BuildContext context, PoiReply poi) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        context: context,
        builder: (context) {
          return Obx(() => SafeArea(
            child: Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("${poi.name}",
                                  style: CustomTextStyle.mediumText(context)
                                      .copyWith()),
                            ),
                            SizedBox(height: 16),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: (){
                                  launchURL(poi.website);
                                },
                                child: Text("${poi.website}",
                                    style: CustomTextStyle.extraSmallText(context)
                                        .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () async {
                                controller.addFavoritePoiObject(poi);
                              },
                              icon: !controller.isThereFavourite(poi)
                                  ? Icon(
                                      Icons.star_border,
                                      size: 42,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: AppColors.redColor,
                                      size: 42,
                                    ),
                            ),
                          ))
                        ],
                      ),
                )
              ],
            ),
          ));
        });
  }
}
