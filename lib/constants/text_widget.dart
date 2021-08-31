import 'package:flutter/material.dart';
import 'package:get/get.dart';



final size = Get.size;
final width = Get.size.width;
final height = Get.size.width;


 customText(Color color,String text,double fontSize,FontWeight fontWeight){
  return
      Text(text,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight,),textAlign: TextAlign.justify,overflow: TextOverflow.ellipsis,maxLines: 1,);
}