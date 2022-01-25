import 'package:crewin_project/controller/controller.dart';
import 'package:crewin_project/screens/finishPage/finishPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
class Auth{


FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
Controller _controller = Controller();

Future<User?> signIn(String email,String password)async{
  var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  return user.user;

}

signOut()async{
  await _firebaseAuth.signOut();
  print("çıkış yapıldı");

}

Future<User> createUser(String email,String password)async{

var user =await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
await _firebaseFirestore.collection('kullanicilar').doc(user.user!.uid).set({"userId":user.user!.uid,"email":email,"password":password});
return user.user!;

}

sendUserInfo(BuildContext context)async{
  var user = await _firebaseAuth.currentUser!.uid;

  await _firebaseFirestore.collection('kullanicilar').doc(user).update(
    {
    'name':Provider.of<Controller>(context,listen: false).getName,
    'gender':Provider.of<Controller>(context,listen: false).getGender,
    'old':Provider.of<Controller>(context,listen: false).getYear,
    'lenght':Provider.of<Controller>(context,listen: false).getLenght,
    'weight':Provider.of<Controller>(context,listen: false).getWeight,

    }
  );
}

}