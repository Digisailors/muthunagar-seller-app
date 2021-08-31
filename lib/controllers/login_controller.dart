import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/text_widget.dart';
import 'package:muthunagar_seller_app/screens/loginPage/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';





class LoginController extends GetxController {
  static LoginController instance = Get.find();



  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController =  TextEditingController();
  RxBool isAdmin = false.obs;
  RxBool isOtpSent = false.obs;
  RxBool isVerified = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;
  RxBool showLoading =false.obs;




  getMobileFormWidget(context){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.07,
            width: size.width * 0.5,
            child: TextFormField(
              controller: phoneController,
              style: TextStyle(color: Colors.black),
              validator: (String? value) {
                if (value!.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              // controller: shopNameController,
              onChanged: (value){
                // itemName = value;
              },
              autofillHints: [AutofillHints.telephoneNumber],
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft:  Radius.circular(10.0),),
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                focusedBorder: InputBorder.none,
                hintText:'Phone No:' ,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width * 0.05,
                ),
                // hoverColor: Colors.white,
                filled: false,
                fillColor: Colors.white
                // focusColor: Colors.white
              ),
            ),
          ),
          Container(
            height: size.height * 0.07,
            width: size.width * 0.15,
            decoration: BoxDecoration(
                color:Color(0xFF178DBC),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
                border: Border.all(color: Colors.grey.shade400)),
            child:  IconButton(icon: Icon(Icons.arrow_forward_sharp,color: Colors.white,), onPressed: mobileNumberOnPressed),
          ),

        ],
      );
  }

  void mobileNumberOnPressed() async{
    showLoading.value = true;
    await auth.verifyPhoneNumber(phoneNumber: '+91${phoneController.text}',
        verificationCompleted: (phoneAuthCredential)async {
          showLoading.value = false;
        },
        verificationFailed: (verificationFailed)async {
          showLoading.value = false;
          Get.snackbar('Failed', verificationFailed.message!);
        },
        codeSent: (verificationId,resendingToken) async {
      showLoading.value = false;
      isOtpSent.value = true;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          this.verificationId = verificationId;
          update();
        }, codeAutoRetrievalTimeout: (verificationId) async {

        });
  }


  getOtpFormWidget(context){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.07,
            width: size.width * 0.5,
            child: TextFormField(
              controller: otpController,
              style: TextStyle(color: Colors.black),
              validator: (String? value) {
                if (value!.length < 3)
                  return " Enter at least 3 character from Customer Name";
                else
                  return null;
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              // controller: shopNameController,
              onChanged: (value){
                // itemName = value;
              },
              autofillHints: [AutofillHints.givenName],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: InputBorder.none,
                hintText:'Verify Otp:' ,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width * 0.05,
                ),
                // hoverColor: Colors.white,
                filled: false,
                // fillColor: Colors.white
                // focusColor: Colors.white
              ),
            ),
          ),
          // Container(
          //   height: size.height * 0.07,
          //   width: size.width * 0.15,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
          //       border: Border.all(color: Colors.grey.shade400)),
          //   child:  IconButton(icon: Icon(Icons.check,color: Colors.black,),
          //       onPressed: otpOnpressed),
          // ),

        ],
      );
  }

  void otpOnpressed(){
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otpController.text);
    signInWithPhoneAuthCredential(phoneAuthCredential,);

  }


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential,) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showLoading.value = true;
    try{
      final authCredential =await auth.signInWithCredential(phoneAuthCredential);
      showLoading.value = false;
      if(authCredential.user != null){
        phoneController.text == '9486960117' ? isAdmin.value = true : null;
        preferences.setBool('isAdmin',  phoneController.text == '9486960117' ? isAdmin.value = true : false);
        preferences.setString('localPhone', phoneController.text);
        isVerified.value = true;
        print(' phoneController.text ${ phoneController.text}');
        print(' isAdmin ${ isAdmin}');

        // Get.offAll(DashBoard());
      }
    }
    on FirebaseAuthException catch (e){
      showLoading.value = false;
      Get.snackbar('Error', e.message!);
    }
  }



  autofillOtp() async {
    await SmsAutoFill().listenForCode;
  }

}

