import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/common/common.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/utils/utils.dart';

class FavouriteScreen extends GetView<FavouriteController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width,
              height: kBottomNavigationBarHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.toggColor
                ),
                child: Text("Back to Map", style: CustomTextStyle.smallText(context).copyWith(
                    color: AppColors.white
                )),
                onPressed: () async{
                  Get.back(result: '');
                },
              ),
            ),
            resizeToAvoidBottomInset: false,
            body: Obx(
              () => controller.favouritePoiListLoading.isTrue
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : controller.favouritePoiList.length != 0 ? AbsorbPointer(
                      absorbing: controller.addOrDeleteOperationProgress.isTrue
                          ? true
                          : false,
                      child: Opacity(
                        opacity: controller.addOrDeleteOperationProgress.value
                            ? 0.4
                            : 1,
                        child: Stack(
                          children: [
                            Obx(() => controller.favouritePoiListLoading.value
                                ? Container(width: 0, height: 0)
                                : Column(
                                    children: controller.favouritePoiList
                                        .map((poi) => Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                border: Border(
                                                  right: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4,
                                                      style: BorderStyle.solid),
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4,
                                                      style: BorderStyle.solid),
                                                  bottom: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4,
                                                      style: BorderStyle.solid),
                                                  left: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.4,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: AppSizes
                                                      .default_margin_size,
                                                  vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("${poi.name}"),
                                                        SizedBox(height: 4),
                                                        Container(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              launchURL(
                                                                  poi.website);
                                                            },
                                                            child: Text(
                                                                "${poi.website}",
                                                                style: CustomTextStyle
                                                                        .extraSmallText(
                                                                            context)
                                                                    .copyWith(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .underline,
                                                                        color: Colors
                                                                            .blue)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: AppColors
                                                                .toggColor),
                                                    child: Text("Remove",
                                                        style: CustomTextStyle
                                                                .smallText(
                                                                    context)
                                                            .copyWith(
                                                                color: AppColors
                                                                    .white)),
                                                    onPressed: () async{
                                                      await controller.removeFavoritePoiObject(poi);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  )),
                            if (controller.addOrDeleteOperationProgress.isTrue)
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Loading.."),
                                    SizedBox(width: 8),
                                    CircularProgressIndicator()
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    ) : Center(
                child: Text(
                  "Not found.",
                  style: CustomTextStyle.extraSmallText(context),
                ),
              ),
            )),
      );
    });
  }

}
