import 'package:flutter/material.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/constants/text_widget.dart';
import 'package:muthunagar_seller_app/screens/addPost/add_post.dart';
import 'package:muthunagar_seller_app/screens/bottomNavBar/bottomNavBar.dart';
import 'package:muthunagar_seller_app/screens/home/home.dart';
import 'package:muthunagar_seller_app/screens/offer/offer.dart';
import 'package:muthunagar_seller_app/screens/profile/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    homeController.getProfileData();
    return Scaffold(
      // bottomNavigationBar:BottomNavbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF178DBC),
        title: Center(child: Text(dashboardController.headerText.value,style: TextStyle(color: Colors.white,),),),
        actions: [
          IconButton(
            onPressed: () async{
              SharedPreferences preferences = await SharedPreferences.getInstance();
              profileController.localPhone = preferences.getString('localPhone');
              profileController.getProfileData();
              Future.delayed(Duration(milliseconds: 1000,),(){
                print(profileController.profile?.name);
                pageViewController.controller.jumpToPage(3);
              });

          }, icon: Icon(Icons.person,color: Colors.white,),),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,),),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                pageViewController.pageindex.value = value;
                print(value);
              },
              controller: pageViewController.controller,
              children: [
                HomePage(),
                AddPost(),
                OfferPage(),
                Profile(),
              ],
            ),),
          Expanded(child: BottomNavbar(),),
        ],
      ),
    );
  }
}
