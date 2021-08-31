
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/firebase_constant.dart';
import 'package:muthunagar_seller_app/modals/categories_modal.dart';


class HomeController extends GetxController {
  static HomeController instance = Get.find();
  // RxList<CategoriesModals> categoriesList = RxList<CategoriesModals>([]);

  CategoriesModals? categoriesModals;



  getProfile() async{
    var data = await  FirebaseFirestore.instance.collection('Admin').doc('categories').get();
    print(data.data()!);
    update();
    return  CategoriesModals.fromMap(data.data()!);
  }


  getProfileData() async {
    categoriesModals = await getProfile();
  }
}