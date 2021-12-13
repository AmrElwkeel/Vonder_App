

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendor_app/src/models/user.dart';

class  FireStoreServices {



  final FirebaseFirestore  _firestore = FirebaseFirestore.instance ;


  Future<void> addUser(Users user){
       return _firestore.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<Users> fetchUser(String userId) {
    return _firestore.collection('users').doc(userId).get().then(
            (snapshot) => Users.fromFireStore(snapshot.data()));
  }









}