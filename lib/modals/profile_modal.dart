import 'package:flutter/material.dart';

class ProfileModals {

  static const ADDRESS = 'Address';
  static const EMAIL = 'Email';
  static const NAME = 'Name';
  static const PHONENO = 'PhoneNo';
  static const UID = 'uid';

  late String? address;
  late String? email;
  late String? name;
  late String? phoneNo;
  late String? uid;
  ProfileModals({this.address,this.email,this.name,this.phoneNo});

  ProfileModals.fromMap(Map<String,dynamic>data){
    address = data[ADDRESS];
    name = data[NAME];
    email = data[EMAIL];
    phoneNo = data[PHONENO];
    uid  = data[UID];
  }
}