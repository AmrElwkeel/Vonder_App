import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor_app/src/styles/colors.dart';



abstract class TextStyles{

  static TextStyle get  body {

     return GoogleFonts.roboto(
          textStyle: TextStyle(
              color: AppColor.darkgray,
              fontSize: 16.0
          ));
}

    static TextStyle get  title {
       return GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppColor.red,
              fontWeight: FontWeight.bold,
              fontSize: 17.0
          ));
    }
  static TextStyle get  subtitle {
    return GoogleFonts.economica(
        textStyle: TextStyle(
            color: AppColor.red,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ));
  }
  static TextStyle get  navTitle {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: AppColor.red,
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ));
  }


    static TextStyle get link => GoogleFonts.roboto(
          textStyle: TextStyle(
              color: AppColor.straw,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ));


    static TextStyle get suggestion =>

       GoogleFonts.roboto(
          textStyle: TextStyle(
              color: AppColor.darkgray,
              fontSize: 17.0
          ));
    static TextStyle get darkColorBlue =>

        GoogleFonts.roboto(
            textStyle: TextStyle(
                color: AppColor.lightblue,
                fontSize: 17.0
            ));



    static TextStyle get buttonTextLight {
      return GoogleFonts.roboto(
          textStyle:const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            fontWeight: FontWeight.bold ,
          ));
    }




}