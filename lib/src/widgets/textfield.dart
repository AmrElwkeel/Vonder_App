import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'package:vendor_app/src/styles/textfield.dart';



class AppTextField extends StatelessWidget {
  final bool isIOS ;
  final String placeholder ;
  final IconData materialIcon;
  final IconData cupertinoIcon ;
  final bool obscureText ;
  final double? cursorHeight ;
  final String? errorText ;
  final TextInputType?  textInputType ;
  final void Function(String)? onChanged ;

  const AppTextField({
    required this.isIOS,
    required this.placeholder,
    required this.cupertinoIcon,
    required this.materialIcon ,
    this.textInputType,
    this.cursorHeight,
    this.obscureText = false ,
     this.errorText,
    this.onChanged ,
    Key? key ,
  }) :super(key:key);

  @override
  Widget build(BuildContext context) {
    if(isIOS){
      return CupertinoTextField(
        padding:  EdgeInsets.symmetric(vertical: TextFieldStyle.textVertical,horizontal:TextFieldStyle.textHorizontal ),
        keyboardType: (textInputType!= null)? textInputType:TextInputType.emailAddress,
        cursorColor: AppColor.darkblue,
        textAlign: TextAlign.center,
        placeholder: placeholder,
        cursorHeight: cursorHeight,
        obscureText: obscureText,
        placeholderStyle: TextFieldStyle.placeholder(),
        prefix: TextFieldStyle.iconPrefix(cupertinoIcon),
        style: TextFieldStyle.text(),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.straw,
            width: 2.0,
          ),
        ),
      );
    }else{
      return Padding(
        padding:  EdgeInsets.symmetric(vertical: TextFieldStyle.textVertical,horizontal:TextFieldStyle.textHorizontal),
        child: TextField(
          keyboardType: (textInputType!= null)? textInputType:TextInputType.emailAddress,
          cursorColor: AppColor.darkblue,
          cursorHeight: cursorHeight,
          obscureText: obscureText,
          style: TextFieldStyle.placeholder(),
          textAlign: TextAlign.center,
          onChanged: onChanged,

          decoration:  InputDecoration(
            prefixIcon: TextFieldStyle.iconPrefix(materialIcon),
            hintText: placeholder,
            errorText: errorText,
            hintStyle:const TextStyle(
            fontSize: 18.0 ,
            ),
            focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              width: 2.0 ,
              color: AppColor.red,
            ),
          ),
            errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 2.0 ,
                color: AppColor.red,
              ),
            ) ,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 2.0 ,
                color: AppColor.straw,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 2.0 ,
                color: AppColor.straw,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 2.0 ,
                color: AppColor.straw,
              ),
            ),
          ),
        ),
      );
    }
  }
}
