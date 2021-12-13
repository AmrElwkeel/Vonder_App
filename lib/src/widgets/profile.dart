import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/bloc/auth_bloc.dart';
import 'dart:io';

import 'package:vendor_app/src/styles/text.dart';




class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return Scaffold(body: pageBody(context),);
    }
  }
}
  Widget pageBody(BuildContext context){
    var authBloc = Provider.of<AuthBloc>(context);
    return  Center(
        child: (Platform.isIOS)? CupertinoButton(child:const Text('Logout'),
            onPressed: () => authBloc.logout()):
             MaterialButton(onPressed: ()=> authBloc.logout(),child: const Text('Logout'),),
    );
  }

