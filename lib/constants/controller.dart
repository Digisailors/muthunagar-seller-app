import 'package:flutter/material.dart';
import 'package:muthunagar_seller_app/controllers/bottom_navbar_controller.dart';
import 'package:muthunagar_seller_app/controllers/dashboard_controller.dart';
import 'package:muthunagar_seller_app/controllers/home_controller.dart';
import 'package:muthunagar_seller_app/controllers/login_controller.dart';
import 'package:muthunagar_seller_app/controllers/pagesController.dart';
import 'package:muthunagar_seller_app/controllers/profile_controller.dart';
import 'package:muthunagar_seller_app/controllers/register_controller.dart';

LoginController loginController = LoginController.instance;
RegisterController registerController = RegisterController.instance;
DashboardController dashboardController = DashboardController.instance;
PageViewController pageViewController = PageViewController.instance;
BottomNavBarController bottomNavBarController = BottomNavBarController.instance;
ProfileController profileController = ProfileController.instance;
HomeController homeController = HomeController.instance;