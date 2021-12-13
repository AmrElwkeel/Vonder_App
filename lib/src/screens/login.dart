import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/bloc/auth_bloc.dart';
import 'package:vendor_app/src/styles/base.dart';
import 'package:vendor_app/src/styles/text.dart';
import 'package:vendor_app/src/widgets/alerts.dart';
import 'package:vendor_app/src/widgets/button_app.dart';
import 'package:vendor_app/src/widgets/icon_social.dart';
import 'package:vendor_app/src/widgets/textfield.dart';



class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);



  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StreamSubscription? _streamSubscription ;
  StreamSubscription? _errorMessageSubscription;
  
  @override
  void initState() {
    final authBloc = Provider.of<AuthBloc>(context , listen: false);
    _streamSubscription = authBloc.user.listen((user){
      if(user != null )Navigator.pushReplacementNamed(context,'/landing');
    });
    _errorMessageSubscription = authBloc.errorMessage.listen((errorMessage) {
      if (errorMessage != '' ) {
        AppAlerts.showErrorDialog(context, errorMessage).then((_) => authBloc.clearErrorMessage());
      }
    });
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamSubscription!.cancel();
    _errorMessageSubscription!.cancel();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
   if(Platform.isIOS){
     return  CupertinoPageScaffold(
       child:pageBody(context,authBloc),
     );
   }else{
     return  Scaffold(
       body: pageBody(context,authBloc),

     );
   }
  }
  Widget pageBody(BuildContext context , AuthBloc authBloc ){
   return ListView(
     padding: const EdgeInsets.all(0.0),
     children: <Widget>[
       Container(height: 30,),
         Container(
           height: MediaQuery.of(context).size.height * .3,
           decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/arr.png'),
                fit: BoxFit.none,
              ),
           ),
         ),
       Container(height: 10,),

       StreamBuilder<String>(
         stream: authBloc.email ,
         builder: (context, snapshot) {
           return AppTextField(
               isIOS: Platform.isIOS,
               placeholder: "Email ",
               cursorHeight: 25.0,
               cupertinoIcon: CupertinoIcons.mail,
               materialIcon: Icons.email,
               onChanged: authBloc.changeEmail,
               errorText: snapshot.error?.toString()

           );
         }
       ),
       StreamBuilder<String>(
         stream: authBloc.password,
         builder: (context, snapshot) {
           return AppTextField(
             isIOS: Platform.isIOS,
             placeholder: "Password ",
             cursorHeight: 25.0,
             cupertinoIcon: CupertinoIcons.lock,
             materialIcon: Icons.lock,
             obscureText: true,
             textInputType: TextInputType.visiblePassword,
             errorText: snapshot.error?.toString(),
             onChanged: authBloc.changePassword ,
           );
         }
       ),
       StreamBuilder<bool>(
         stream: authBloc.isValid,
         builder: (context, snapshot) {
           return  AppButton(buttonText: "Login",buttonType:
           (snapshot.data == true ) ? ButtonType.LightBlue :ButtonType.Disabled ,
             onPressed: authBloc.loginEmail,
          );
         }
       ),

       Center(child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text('Or ' , style: TextStyles.suggestion,),
       ),),
        Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget> [
         Center(child: SocialButton(socialType: SocialType.Facebook,)),
         Center(child: SocialButton(socialType: SocialType.Google,)),
          
       ],),
        Container(height: 10,),
       Padding(
           padding : BaseStyle.ListPadding ,

           child: Center(
             child: Text.rich(
               TextSpan(
                 text: 'New Her ?  ',
                 style: TextStyles.body,
                 children: [
                   TextSpan(
                     text: 'SignUp' ,
                     style: TextStyles.link ,
                     recognizer: TapGestureRecognizer()
                     ..onTap = ()=> Navigator.of(context).pushNamed('/signup'),
                   ),
                 ],
               ),
             ),
           ),

       ),

     ],
   );
  }
}

