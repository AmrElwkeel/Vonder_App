import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/src/widgets/button_app.dart';






class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(Platform.isIOS){
      return CupertinoPageScaffold(child: pageBody(context),);
    }
    else{
      return Scaffold(body: pageBody(context));
    }

  }


  Widget pageBody(BuildContext context){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            AppButton(
                buttonText: 'Vonder Page',
                buttonType: ButtonType.Straw,
                onPressed: ()=> Navigator.of(context).pushNamed('/vendor') ,
            ),

        ],
      );
  }
}
