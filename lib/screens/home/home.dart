import 'package:flutter/material.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/constants/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color(0xFF178DBC),
      //   title: Center(child: Text(dashboardController.headerText.value,style: TextStyle(color: Colors.white,),),),
      //   actions: [
      //     IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,),),
      //     IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,),),
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 20,
              child: ListTile(title: customText(Colors.black, 'Search', height * 0.03, FontWeight.bold),
                trailing: Icon(Icons.search,color: Colors.black,),),
            ),
          ),
        ],
      ),
    );
  }
}
