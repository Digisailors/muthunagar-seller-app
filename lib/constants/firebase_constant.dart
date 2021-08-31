import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/controllers/bottom_navbar_controller.dart';
import 'package:muthunagar_seller_app/controllers/dashboard_controller.dart';
import 'package:muthunagar_seller_app/controllers/home_controller.dart';
import 'package:muthunagar_seller_app/controllers/login_controller.dart';
import 'package:muthunagar_seller_app/controllers/pagesController.dart';
import 'package:muthunagar_seller_app/controllers/profile_controller.dart';
import 'package:muthunagar_seller_app/controllers/register_controller.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;



getPut() async {
  await initialization.then((value) {
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(DashboardController());
    Get.put(PageViewController());
    Get.put(BottomNavBarController());
    Get.put(ProfileController());
    Get.put(HomeController());
  });
}