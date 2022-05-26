import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/common/common.dart';
import 'package:togg/pages/pages.dart';

class HomeScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(),
        ),
      );
    });
  }
}
