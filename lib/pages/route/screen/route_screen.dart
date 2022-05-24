import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/pages/pages.dart';

class RouteScreen extends GetView<RouteController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouteController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(

              ),
            ),
          ));
    });
  }
}
