import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muthunagar_seller_app/constants/color_constants.dart';
import 'package:muthunagar_seller_app/constants/constant.dart';
import 'package:muthunagar_seller_app/constants/controller.dart';
import 'package:muthunagar_seller_app/constants/firebase_constant.dart';
import 'package:muthunagar_seller_app/constants/text_widget.dart';
import 'package:muthunagar_seller_app/controllers/profile_controller.dart';
import 'package:muthunagar_seller_app/screens/loginPage/login_page.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProfileController>(
      builder: (profileController) {
        return Obx(
          ()=> Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: profileController.nameController,
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
                              hintText:profileController.profile?.name,
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
                          controller:  profileController.emailController,
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
                              hintText:profileController.profile?.email ,
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
                                controller:  profileController.phoneController,
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
                                    hintText:profileController.profile?.phoneNo,
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
                              loginController.phoneController.text = profileController.phoneController.text;
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
                                controller:  profileController.otpController,
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
                              loginController.otpController.text = profileController.otpController.text;
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
                          controller:  profileController.addressController,
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
                              hintText:profileController.profile?.address,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            profileController.save();

                          },
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: Card(
                              color: primary,
                              child: Center(child:customText(Colors.white, 'Save', height * 0.05, FontWeight.bold)),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            auth.signOut();
                            Get.offAll(LoginPage());
                          },
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: Card(
                              color: bgColor,
                              child: Center(child:customText(Colors.black, 'Logout', height * 0.05, FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
        );
      }
    );
  }
}
