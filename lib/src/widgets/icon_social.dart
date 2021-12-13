import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vendor_app/src/styles/base.dart';
import 'package:vendor_app/src/styles/button.dart';
import 'package:vendor_app/src/styles/colors.dart';






class SocialButton extends StatelessWidget {

  final SocialType socialType ;
  const SocialButton({
      required this.socialType ,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color? buttonColor ;
    Color iconColor ;
    TextStyle fontStyle ;
    IconData icon  ;

    switch(socialType){
      case SocialType.Facebook :
        iconColor = Colors.white ;
        buttonColor =Colors.blue[800];
        icon =FontAwesomeIcons.facebookF ;
        break;

      case SocialType.Google :
        iconColor = Colors.white ;
        buttonColor =Colors.blue[600];
        icon =FontAwesomeIcons.google ;
        break;



    }


    return Padding(
      padding: BaseStyle.ListPadding,
      child:GestureDetector(

        onTap: (){
          Navigator.of(context).pushReplacementNamed('/signup');
        },
        child: Center(
          child: Container(
            height: ButtonStyles.buttonHight,
            width: ButtonStyles.buttonHight,
            child: Center(child: Icon(icon , color:iconColor ,size: 35.5,)),
            decoration: BoxDecoration(
              color: buttonColor ,
              borderRadius: BorderRadius.circular(BaseStyle.borderRaduis),
              boxShadow: BaseStyle.boxShodowPressed,
            ),
          ),
        ),
      ),
    );
  }
}


enum SocialType {Facebook , Google}