import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/firebase_constant.dart';
import 'package:muthunagar_seller_app/screens/dashboard/dashboard.dart';
import 'package:muthunagar_seller_app/screens/loginPage/login_page.dart';
import 'package:muthunagar_seller_app/screens/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await getPut();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      // Register(),
    );
  }
}

