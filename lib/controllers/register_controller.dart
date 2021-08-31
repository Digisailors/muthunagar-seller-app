import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/firebase_constant.dart';


class RegisterController extends GetxController {
  static RegisterController instance = Get.find();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  RxBool loadingScreen = false.obs;


  register() async{
    loadingScreen.value = true;
    print('loadingScreen ${loadingScreen}');
   if(phoneController.text != '' && emailController.text != '' && nameController.text != '' && addressController.text != ''){

     await FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(phoneController.text).set({
       'Name':nameController.text,
       'Email':emailController.text,
       'PhoneNo':phoneController.text,
       'Address':addressController.text,
     }).then((value) {
       loadingScreen.value = false;
       FirebaseFirestore.instance.collection('Seller').doc(phoneController.text).update({
         'uid':auth.currentUser!.uid,
       });
     });
   }
   else
     {
       Get.snackbar('Warning', 'Please Fill all the fields');
     }
  }

}