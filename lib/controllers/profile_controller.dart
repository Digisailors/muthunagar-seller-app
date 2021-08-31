import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/constants/firebase_constant.dart';
import 'package:muthunagar_seller_app/modals/profile_modal.dart';
import 'package:muthunagar_seller_app/screens/loginPage/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  RxBool loadingScreen = false.obs;
  var localPhone;

  ProfileModals? profile;


  @override
  void onReady() async {
    // TODO: implement onInit
  // profileDetails.bindStream(getProfile());
  //  getProfileData();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    localPhone = preferences.getString('localPhone');
    print('localPhone $localPhone');
    super.onReady();
  }

   getProfile() async{
     var data = await  FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(localPhone).get();
     print(data.data());
     update();
     return  ProfileModals.fromMap(data.data()!);

  }



  save() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();

    if(phoneController.text !=''){
      loadingScreen.value = true;
      if(loginController.isOtpSent.value == true  && loginController.isVerified.value ==true){

        FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(phoneController.text).set({
          'Name': nameController.text == '' ? profileController.profile?.name : nameController.text,
          'Email' : emailController.text == '' ? profileController.profile?.email : emailController.text,
          'PhoneNo' : phoneController.text == ''? profileController.profile?.phoneNo : phoneController.text,
          'Address': addressController.text == '' ? profileController.profile?.address : addressController.text,
        }).then((value) {
          print('updated phone number to firebase');
          FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(localPhone).delete();
          // FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(phoneController.text).update({
          //   'uid': auth.currentUser?.uid,
          // });
          loadingScreen.value = false;
          changingPhoneNumberSettings();
          update();
          preferences.setString('localPhone', phoneController.text);
          // getProfileData();
          Get.offAll(LoginPage());
        });



      }
      else
        {
          Get.snackbar('Warning', 'Please Verify the phone NUmber Change with OTP');
        }
    }

    if(phoneController.text ==''){
      loadingScreen.value = true;
      if( emailController.text != '' || nameController.text != '' || emailController.text != ''){
        FirebaseFirestore.instance.collection('Seller').doc('Login').collection('Login').doc(profileController.profile?.phoneNo).update({
          'Name': nameController.text == '' ? profileController.profile?.name : nameController.text,
          'Email' : emailController.text == '' ? profileController.profile?.email : emailController.text,
          'Address': addressController.text == '' ? profileController.profile?.address : addressController.text,
        }).then((value) {
          loadingScreen.value = false;
          nameController.text = '';
          emailController.text = '';
          addressController.text ='';
          changingPhoneNumberSettings();
          update();
          // getProfileData();
          pageViewController.controller.jumpToPage(0);
        });
      }
      else
        {
          Get.snackbar('Warning', 'Please Make Any Changes In Above Code');
        }
    }
  }

  getProfileData() async {
    profile = await getProfile();
  }

  changingPhoneNumberSettings(){
    print('changing the settings');
    loginController.isVerified.value =false;
    loginController.isOtpSent.value = false;
    loginController.currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
    phoneController.text = '';
    otpController.text = '';
  }


}