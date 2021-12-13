import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:vendor_app/src/styles/text.dart';




class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(child: pageBody(context));
    }else{
       return Scaffold(body: pageBody(context),);
    }

  }
  Widget pageBody(BuildContext context){
    return const Center(child: Text('Orders',),);
  }
}
