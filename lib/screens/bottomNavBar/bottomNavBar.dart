


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:muthunagar_seller_app/constants/color_constants.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/screens/addPost/add_post.dart';
import 'package:muthunagar_seller_app/screens/home/home.dart';
import 'package:muthunagar_seller_app/screens/offer/offer.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  // int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: textcolor);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
   AddPost(),
    OfferPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Obx(
                  ()=> GNav(
                rippleColor: Colors.grey.shade100,
                hoverColor:Colors.grey.shade100,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey.shade100,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    backgroundColor: primary,
                    iconColor: primarytext,
                    textColor: textcolor,
                    iconActiveColor: textcolor,

                  ),
                  GButton(
                    icon: LineIcons.plus,
                    text: 'Add',
                    backgroundColor: primary,
                    iconColor: primarytext,
                    textColor: textcolor,
                    iconActiveColor: textcolor,
                  ),
                  // GButton(
                  //   icon: LineIcons.indianRupeeSign,
                  //   text: 'Fees',
                  // ),
                  GButton(
                    icon: Icons.local_offer,
                    text: 'Offer',
                    backgroundColor: primary,
                    iconColor: primarytext,
                    textColor: textcolor,
                    iconActiveColor: textcolor,

                  ),
                ],
                selectedIndex: bottomNavBarController.selectedIndex.value,
                onTabChange: (index) {
                  setState(() {
                    bottomNavBarController.selectedIndex.value = index;
                    if(index == 0){
                      pageViewController.controller.jumpToPage(0);
                    }
                    if(index == 1){
                      pageViewController.controller.jumpToPage(1);
                    }
                    if(index == 2){
                      pageViewController.controller.jumpToPage(2);
                    }
                    // index == 1 ?? pageViewController.controller.jumpToPage(1);
                    // index == 2 ?? pageViewController.controller.jumpToPage(2);
                    // index == 3 ?? pageViewController.controller.jumpToPage(3);
                    print(index);
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}