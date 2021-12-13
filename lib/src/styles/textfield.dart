import 'package:flutter/material.dart';
import 'package:vendor_app/src/styles/base.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'package:vendor_app/src/styles/text.dart';
abstract class TextFieldStyle{

     static double get textHorizontal => BaseStyle.listfieldHorizontel ;
     static double get textVertical => BaseStyle.listfieldVertical ;
     static TextStyle text(){
        return TextStyles.body;
     }

     static TextStyle placeholder(){
       return TextStyles.suggestion;
     }


     static Widget iconPrefix(IconData icon){
       return Padding(
           padding: const EdgeInsets.only(left: 8.0),
         child: Icon(
            icon,
           size: 35.0,
           color: AppColor.lightblue,

         )
       );
     }



}