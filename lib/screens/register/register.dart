import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/constant.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/constants/text_widget.dart';
import 'package:muthunagar_seller_app/screens/loginPage/login_page.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: registerController.nameController,
                  style: TextStyle(color: Colors.black),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  // ],
                  // controller: shopNameController,
                  onChanged: (value){
                    // itemName = value;
                  },
                  autofillHints: [AutofillHints.name],
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText:'NAME:' ,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.05,
                      ),
                      // hoverColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white
                    // focusColor: Colors.white
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller:  registerController.emailController,
                  style: TextStyle(color: Colors.black),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.emailAddress,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  // ],
                  // controller: shopNameController,
                  onChanged: (value){
                    // itemName = value;
                  },
                  autofillHints: [AutofillHints.email],
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText:'EMAIL ID:' ,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.05,
                      ),
                      // hoverColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white
                    // focusColor: Colors.white
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.07,
                    width: size.width *0.8,
                    child: Card(
                      elevation: 20,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller:  registerController.phoneController,
                        style: TextStyle(color: Colors.black),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        // controller: shopNameController,
                        onChanged: (value){
                          // itemName = value;
                        },
                        autofillHints: [AutofillHints.telephoneNumber],
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText:'PHONE NO:' ,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: size.width * 0.05,
                            ),
                            // hoverColor: Colors.white,
                            filled: true,
                            fillColor: Colors.white
                          // focusColor: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                        color:Color(0xFF178DBC),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
                        border: Border.all(color: Colors.grey.shade400)),
                    child: loginController.isOtpSent.value ?Icon(Icons.check,color: Colors.white,)  : IconButton(icon: Icon(Icons.arrow_forward_sharp,color: Colors.white,), onPressed: (){
                      loginController.phoneController.text = registerController.phoneController.text;
                      loginController.mobileNumberOnPressed();
                    }),
                  ),
                ],
              ),
            ),
            loginController.showLoading.value
                ? Loading()
                : loginController.currentState !=
                MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
              height: size.height * 0.07,
              width: size.width *0.8,
              child: Card(
                      elevation: 20,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller:  registerController.otpController,
                        style: TextStyle(color: Colors.black),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        // controller: shopNameController,
                        onChanged: (value){
                          // itemName = value;
                        },
                        autofillHints: [AutofillHints.telephoneNumber],
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText:'verify OTP',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              fontSize: size.width * 0.05,
                            ),
                            // hoverColor: Colors.white,
                            filled: true,
                            fillColor: Colors.white
                          // focusColor: Colors.white
                        ),
                      ),
              ),
            ),
                      Container(
                        height: size.height * 0.06,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                            color:Color(0xFF178DBC),
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight:  Radius.circular(12),),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: loginController.isVerified.value ? Icon(Icons.check,color: Colors.white,) : IconButton(icon: Icon(Icons.arrow_forward_sharp,color: Colors.white,), onPressed: (){
                          loginController.otpController.text = registerController.otpController.text;
                          loginController.otpOnpressed();
                        }),
                      ),
                    ],
                  ),
                )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: TextFormField(maxLines: 5,
                  textInputAction: TextInputAction.done,
                  controller:  registerController.addressController,
                  style: TextStyle(color: Colors.black),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  // ],
                  // controller: shopNameController,
                  onChanged: (value){
                    // itemName = value;
                  },
                  autofillHints: [AutofillHints.fullStreetAddress],
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText:'ADDRESS:' ,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.05,
                      ),
                      // hoverColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white
                    // focusColor: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            registerController.loadingScreen.value == true ? Loading() : InkWell(
              onTap: ()=> registerController.register(),
              child:
              Card(
                color: Color(0xFF178DBC),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child:Center(
                    child:  customText(Colors.white, 'REGISTER', height * 0.05, FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(Colors.grey, "LET'S", height * 0.03, FontWeight.bold),
                SizedBox(
                  width: width * 0.03,
                ),
                customText(Colors.purple, "LOGIN", height * 0.03, FontWeight.bold)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
