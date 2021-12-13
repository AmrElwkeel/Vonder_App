import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/src/app.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'package:vendor_app/src/styles/text.dart';




abstract class AppNavBar{


  static CupertinoSliverNavigationBar cupertinoSliverNavigationBar ({String? title,BuildContext? context}){
      return CupertinoSliverNavigationBar(
        largeTitle: Text(title! ,style: TextStyles.navTitle,),
        backgroundColor: Colors.transparent,
        border: null,

      );
  }

  static SliverAppBar sliverAppBar ({ required String title ,required TabBar tabBar}){
       return SliverAppBar(
         title: Text(title,style: TextStyles.navTitle,),
         backgroundColor: AppColor.darkblue,
         bottom: tabBar,
         floating: true,
         pinned: true,
         snap: true,
       );
  }



}