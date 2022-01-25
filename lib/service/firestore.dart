import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase{

  FirebaseFirestore _firestore =FirebaseFirestore.instance;
  FirebaseAuth _auth= FirebaseAuth.instance;



  Future bilgileriGetir()async{
    var userUid = await _auth.currentUser!.uid;
    var bilgiler =_firestore.collection("kullanicilar").doc(userUid).snapshots();
    print("***************BİLGİLER *********************"+bilgiler.toString());

    return bilgiler;
  }
}