import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:togg/common/common.dart';
import 'package:togg/pages/pages.dart';

class HomeScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Obx(() => AbsorbPointer(
            absorbing: controller.poiListLoading.isTrue ? true : false,
            child: Opacity(
              opacity: controller.poiListLoading.value ? 0.2 : 1,
              child: Stack(
                children: [
                  Obx(() => controller.poiListLoading.value ? Container(width:0, height: 0) : GoogleMap(
                    initialCameraPosition: controller.initialCameraPosition.value,
                    zoomControlsEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: (cont) {
                      controller.googleMapController = cont;
                    },
                    markers: Set<Marker>.of(controller.allMarkers),
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
}
