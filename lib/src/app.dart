

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/bloc/auth_bloc.dart';
import 'package:vendor_app/src/screens/landing.dart';
import 'package:vendor_app/src/styles/colors.dart';
import 'routs.dart';
import 'screens/login.dart';

import 'dart:io';

import 'styles/text.dart';

final authBloc = AuthBloc();
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        Provider(create: (context) => authBloc),
        FutureProvider(create: (context) => authBloc.isLoggedIn(),
          initialData: true,
    ),
      ],
        child:  const PlatFormApp());

  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}


class PlatFormApp extends StatelessWidget {
  const PlatFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isLogged = Provider.of<bool>(context);

    if(Platform.isIOS){
      return  CupertinoApp(
        home:  (isLogged == null ) ? loadingScreen(true):(isLogged == true )? Landing():Login(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routs.cupertinoRoute,
        theme: CupertinoThemeData(
          primaryColor: AppColor.straw,
            scaffoldBackgroundColor:Colors.white,
          textTheme:CupertinoTextThemeData(
             tabLabelTextStyle: TextStyles.suggestion ,
          ),
        ),
      );
    }
    else{
      return MaterialApp(
        home: (isLogged == null ) ? loadingScreen(false):(isLogged == true )? Landing():Login(),
        onGenerateRoute: Routs.materialRoute,
        debugShowCheckedModeBanner: false ,
        theme:  ThemeData(
            primaryColor: AppColor.straw,
            scaffoldBackgroundColor:Colors.white,

        ),
      );
    }

  }
}


Widget loadingScreen (bool isIOS){
  return (isIOS)? const CupertinoPageScaffold(child: Center(child: CupertinoActivityIndicator(),)):
  const Scaffold(body: Center(child: CircularProgressIndicator(),),);
}
