import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';

class FavouriteScreen extends GetView<FavouriteController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: GestureDetector(
              onTap: (){

              },
              child: Text(
                "TOGGXD"
              ),
            )
          ),
        ),
      );
    });
  }
}
