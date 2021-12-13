
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/src/screens/landing.dart';
import 'package:vendor_app/src/screens/signup.dart';
import 'package:vendor_app/src/screens/vendor.dart';

import 'screens/login.dart';

abstract class Routs{


    static MaterialPageRoute? materialRoute (RouteSettings settings){

        switch(settings.name){
            case "/landing":
                return MaterialPageRoute(builder: (context) =>  Landing());

            case "/signup":
                return MaterialPageRoute(builder: (context) =>  SignUp());

            case "/login":
                return MaterialPageRoute(builder: (context) =>  Login());

            case "/vendor":
                return MaterialPageRoute(builder: (context) =>  const Vendor());

            default:
                return MaterialPageRoute(builder: (context) =>  Login());

        }
    }



    static  CupertinoPageRoute? cupertinoRoute (RouteSettings settings){

        switch(settings.name){

            case "/landing":
                return CupertinoPageRoute(builder: (context) => const Landing());

            case "/signup":
                return CupertinoPageRoute(builder: (context) => const SignUp());

            case "/login":
                return CupertinoPageRoute(builder: (context) =>  Login());

            case "/vendor":
                return CupertinoPageRoute(builder: (context) => const Vendor());

            default:
                return CupertinoPageRoute(builder: (context) =>  Login());

        }
    }
}