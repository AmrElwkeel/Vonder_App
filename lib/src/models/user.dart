


class Users{
  final String? userId ;
  final String? email ;

  Users({this.email , this.userId});

  Map<String , dynamic > toMap (){
     return {
        'userId':userId ,
        'email':email ,
     };
  }


  Users.fromFireStore(Map<String , dynamic>? firstore):
      userId  = firstore!['userId'],
      email = firstore['email'];












}