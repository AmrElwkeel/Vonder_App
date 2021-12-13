


import 'package:flutter/cupertino.dart';
import 'package:vendor_app/src/styles/colors.dart';

abstract class BaseStyle{


  static double get borderRaduis => 35.0 ;
  static double get borderWidth => 2.0 ;
  static double get listfieldHorizontel => 20.0 ;
  static double get listfieldVertical => 8.0 ;
  static double get animationOffset => 2.0 ;
  static EdgeInsets get ListPadding{
         return EdgeInsets.symmetric(
           horizontal: listfieldHorizontel,
           vertical: listfieldVertical,
         );
  }



  static List<BoxShadow> get boxShodow{
    return [
      BoxShadow(
        color: AppColor.darkgray.withOpacity(.5),
        offset: Offset(1.0,2.0),
        blurRadius: 2.0 ,
      ),
    ];
  }
  static List<BoxShadow> get boxShodowPressed{
    return [
      BoxShadow(
        color: AppColor.darkgray.withOpacity(.5),
        offset: Offset(1.0,1.0),
        blurRadius: 1.0 ,
      ),
    ];
  }






}