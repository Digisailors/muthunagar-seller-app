import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();
  late TabController controller;
  RxInt selectedIndex = 0.obs;
  RxString headerText = 'Home'.obs;
}