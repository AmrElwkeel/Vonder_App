




import 'package:flutter/material.dart';
import 'package:vendor_app/src/styles/text.dart';

abstract class AppAlerts{


    static Future<void> showErrorDialog(BuildContext context ,String errorMessage)async{
             return showDialog(
                 context: context,
                 barrierDismissible: false,
                 builder: (context){
                   return   AlertDialog(
                      title: Text("Error" , style: TextStyles.subtitle,),
                     content: SingleChildScrollView(
                       child: ListBody(
                         children: <Widget>[
                           Text(errorMessage , style: TextStyles.body,),
                         ],
                       ),
                     ),
                     actions: [
                       MaterialButton(onPressed: (){
                         Navigator.of(context).pop();
                       }, child: Text('Okay ' ,style: TextStyles.body,),),
                     ],
                   );
                 }
             );
    }




}