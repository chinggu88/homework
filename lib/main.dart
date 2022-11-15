import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_work/const/appPage.dart';
import 'package:home_work/controller/clock_controller.dart';
import 'package:home_work/view/clock/clock_page.dart';
import 'package:home_work/view/home.dart';
import 'package:home_work/view/loadingCircle/circle_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: home,
    getPages: [
      GetPage(
          name: home,
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            // Get.put(LoginController());
          })),
      GetPage(
          name: clock,
          page: () => Clock(),
          binding: BindingsBuilder(() {
            Get.put(Clock_controller());
          })),
      GetPage(
          name: circle,
          page: () => circlePage(),
          binding: BindingsBuilder(() {
            // Get.put(Clock_controller());
          })),
    ],
  ));
}
