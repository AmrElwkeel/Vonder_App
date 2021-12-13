import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/bloc/auth_bloc.dart';
import 'package:vendor_app/src/styles/base.dart';
import 'package:vendor_app/src/styles/text.dart';
import 'package:vendor_app/src/widgets/button_app.dart';
import 'package:vendor_app/src/widgets/textfield.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState() {
    // TODO: implement initState

    final authBloc = Provider.of<AuthBloc>(context , listen: false);
    authBloc.user.listen((user){
      if(user != null) Navigator.pushReplacementNamed(context, '/landing');

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
          child: pageBody(context, authBloc)
      );
    } else {
      return Scaffold(
        body: pageBody(context, authBloc),

      );
    }
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
    return ListView(
      padding: const EdgeInsets.all(0.0),
      children: <Widget>[
        Container(height: 50,),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * .3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/arr.png'),
              fit: BoxFit.none,
            ),
          ),
        ),
        Container(height: 20,),

        StreamBuilder<String>(
            stream: authBloc.email,
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
                onChanged: authBloc.changePassword,
              );
            }
        ),
        StreamBuilder<bool>(
            stream: authBloc.isValid,
            builder: (context, snapshot) {
              return AppButton(buttonText: "SignUP", buttonType:
              (snapshot.data == true) ? ButtonType.LightBlue : ButtonType
                  .Disabled,
                onPressed: authBloc.signupEmail,
              );
            }
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              vertical: BaseStyle.listfieldVertical + 10,
              horizontal: BaseStyle.listfieldHorizontel),
          child: Center(
            child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Text('Already Have Account' ,

            style: TextStyles.darkColorBlue,
            ),
          ),),
        )
      ],
    );
  }
}