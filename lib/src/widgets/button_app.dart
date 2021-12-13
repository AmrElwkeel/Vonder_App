import 'package:flutter/material.dart';
import 'package:vendor_app/src/styles/base.dart';
import 'package:vendor_app/src/styles/button.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'package:vendor_app/src/styles/text.dart';


class AppButton extends StatefulWidget {
  final String? buttonText ;
  final ButtonType? buttonType ;
  final void Function()? onPressed ;
  const AppButton({
    required this.buttonText ,
    this.buttonType,
    this.onPressed,

    Key? key})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool presed = false ;
  @override
  Widget build(BuildContext context) {
    TextStyle? fontStyle ;
    Color? buttonColor ;

    switch(widget.buttonType){
      case ButtonType.Straw :
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.straw ;
        break ;

      case ButtonType.LightBlue :
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.lightblue ;
        break ;

       case ButtonType.DarkBule :
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.darkblue ;
        break ;

       case ButtonType.Disabled:
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.lightgray ;
        break ;
      case ButtonType.DarkGray :
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.darkgray ;
        break ;

       default :
        ButtonType.LightBlue ;
        fontStyle = TextStyles.buttonTextLight ;
        buttonColor = AppColor.lightblue ;
        break ;





    }
    return AnimatedContainer(
      padding: EdgeInsets.only(
          top: (presed) ? BaseStyle.listfieldVertical + 5.0 : BaseStyle.listfieldVertical,
          bottom: (presed) ? BaseStyle.listfieldVertical - BaseStyle.animationOffset: BaseStyle.listfieldVertical,
          left: BaseStyle.listfieldHorizontel,
          right: BaseStyle.listfieldHorizontel,
      ),
      duration: const Duration(milliseconds: 20),
      child: GestureDetector(
        //Logic TODO
        onTap: (){
          if(widget.buttonType != ButtonType.Disabled){
             widget.onPressed!();
          }
        },
        onTapDown: (details){
          setState(() {
            if(widget.buttonType != ButtonType.Disabled)presed = !presed ;
          });
        },
        onTapUp: (details){
          setState(() {
            if(widget.buttonType != ButtonType.Disabled) presed = !presed ;
          });
        },
        child: Container(
          child:  Center(child:  Text(widget.buttonText! , style:fontStyle,),),
          height: ButtonStyles.buttonHight,
          width: MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(

             color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyle.borderRaduis),
             boxShadow:presed ? BaseStyle.boxShodowPressed: BaseStyle.boxShodow ,
          ),
        ),
      ),
    );
  }
}
enum ButtonType{LightBlue  , Straw ,Disabled , DarkBule , DarkGray}
