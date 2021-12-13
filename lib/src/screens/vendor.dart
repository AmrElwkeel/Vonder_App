import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/bloc/auth_bloc.dart';
import 'package:vendor_app/src/widgets/navbar.dart';
import 'package:vendor_app/src/widgets/orders.dart';
import 'package:vendor_app/src/widgets/productes.dart';
import 'package:vendor_app/src/widgets/profile.dart';
import 'package:vendor_app/src/widgets/tabbar.dart';
import 'package:vendor_app/src/widgets/vendor_scafold.dart';

import 'login.dart';







class Vendor extends StatefulWidget {

   const Vendor({Key? key}) : super(key: key);


  @override
  State<Vendor> createState() => _VendorState();

  static TabBar get vendorTabBar{


    return  TabBar(
       unselectedLabelColor: TabBarStyles.unSelectedLabColor ,
       labelColor:  TabBarStyles.labColor ,
       indicatorColor:  TabBarStyles.indicatorColor,
      tabs:const <Widget>[
      Tab(icon:  Icon(Icons.list),),
      Tab(icon:  Icon(Icons.shopping_cart),),
      Tab(icon:  Icon(Icons.person),),
    ],);
  }
}

class _VendorState extends State<Vendor> {
  StreamSubscription? _streamSubscription ;

  @override
  void initState() {

    Future.delayed(Duration.zero,(){
      var authBloc = Provider.of<AuthBloc>(context,listen:false);
      _streamSubscription = authBloc.user.listen((user) {
       if(user == null ) Navigator.pushNamedAndRemoveUntil(context,'/login',(route)=>false);
      });
    });
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamSubscription!.cancel();
  }
  @override
  Widget build(BuildContext context) {

   if(Platform.isIOS){
        return CupertinoPageScaffold(
            child: NestedScrollView(

              headerSliverBuilder: (BuildContext context , bool innerBoxIsScrolled ){
                 return <Widget>[
                   AppNavBar.cupertinoSliverNavigationBar(
                     title: "Vendor Name",
                     context: context,
                   ),

                 ];
              },
              body: VendorScaffold.cupertinoTabScaffold ,
            ));
   }else{

    return DefaultTabController(
         length: 3
      ,
        child: Scaffold(
          body: NestedScrollView(

            headerSliverBuilder: (BuildContext context , bool innerBoxScrolled){
              return <Widget>[
                AppNavBar.sliverAppBar(title: 'Vendor Name', tabBar: Vendor.vendorTabBar),
              ];
            },
            body: const TabBarView(
              children: [
                Products(),
                Orders(),
                Profile(),



              ],
            ),
          ),
        ),
    );
   }

  }
}
