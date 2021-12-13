




import 'package:flutter/cupertino.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'package:vendor_app/src/widgets/orders.dart';
import 'package:vendor_app/src/widgets/productes.dart';
import 'package:vendor_app/src/widgets/profile.dart';

abstract class VendorScaffold{


       static CupertinoTabScaffold get  cupertinoTabScaffold {
         return  CupertinoTabScaffold(
         tabBar:_cupertinoTapBar,
             tabBuilder: (context ,index){
                 return _pageSelected(index);
             });
       }
       static get _cupertinoTapBar{
           return  CupertinoTabBar(
             backgroundColor: AppColor.darkblue,
             items:const  <BottomNavigationBarItem> [
                 BottomNavigationBarItem(
                    icon:  Icon(CupertinoIcons.create ,
                      semanticLabel:"Products",
                    )),
               BottomNavigationBarItem(
                   icon:  Icon(CupertinoIcons.shopping_cart ,
                     semanticLabel:"Orders",
                   )),
               BottomNavigationBarItem(
                   icon:  Icon(CupertinoIcons.person ,
                     semanticLabel:"Profile",
                   )),
             ],
           );
       }

       static Widget _pageSelected(int index){
         if(index == 0 ){
               return Products();
         }
         if(index == 1 ){
             return Orders();
         }
       return Profile();
       }



}