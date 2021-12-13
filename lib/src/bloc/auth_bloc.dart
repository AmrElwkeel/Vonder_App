// ignore_for_file: null_check_always_fails

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:vendor_app/src/models/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/src/services/firestore_services.dart';


final RegExp regExpEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.'
    r'[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');




class AuthBloc {


  //Streem
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreServices _fireStoreServices = FireStoreServices() ;
  final _user = BehaviorSubject<Users>();
  final _errorMessage = BehaviorSubject<String>();



  // Getters

   Stream<String>  get email => _email.stream.transform(validateEmail) ;
   Stream<String>  get password => _password.stream.transform(validatePassword) ;
   Stream<bool> get isValid => CombineLatestStream.combine2(
       email, password, (email , password) => true);
   Stream<Users> get user => _user.stream ;
  Stream<String> get errorMessage => _errorMessage.stream;
  String get userId => _user.value.userId! ;
  //sets
   Function(String) get changeEmail => _email.sink.add;
   Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
    _user.close();
    _errorMessage.close();
  }
  //transformer
    final validateEmail = StreamTransformer<String , String >.fromHandlers(
        handleData: (email , sink){
          if(regExpEmail.hasMatch(email.trim())){
              sink.add(email.trim());
          }else{
            sink.addError("Must Be valid Email Address ");
          }
    });
  final validatePassword = StreamTransformer<String , String >.fromHandlers(
      handleData: (password , sink){
        if(password.length >= 8){
          sink.add(password.trim());
        }else{
          sink.addError("8 Character Minimum ");
        }
      });
  // functions
   loginEmail()async{
     try{
      UserCredential authResult =
      await _auth.signInWithEmailAndPassword(
          email: _email.value.trim(),
          password: _password.value.trim());
     var user = await _fireStoreServices.fetchUser(authResult.user!.uid);
     _user.sink.add(user);
     }on PlatformException catch(error){

       _errorMessage.sink.add(error.message!);

     }
   }
  signupEmail()async{
    try{
      UserCredential authResult =
      await _auth.createUserWithEmailAndPassword(
          email: _email.value.trim(),
          password: _password.value.trim());
      var user = Users(userId:authResult.user!.uid , email : _email.value.trim() ,) ;
      await _fireStoreServices.addUser(user);
      _user.sink.add(user);
    }on PlatformException catch(error){
      print(error);
      _errorMessage.sink.add(error.message!);

    }
  }
  Future<bool> isLoggedIn()async{
     var firebaseUser =  _auth.currentUser;
     if(firebaseUser  == null) return false ;
       var user = await _fireStoreServices.fetchUser(firebaseUser.uid);
       if(user == null) return false ;
       _user.sink.add(user);
     return true ;
  }


     logout()async{
       var u = Users(userId: null , email: null);
        _user.sink.add(u);
        await _auth.signOut();
       }
  clearErrorMessage(){
    _errorMessage.sink.add('');
  }






}