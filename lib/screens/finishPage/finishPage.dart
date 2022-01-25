import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewin_project/controller/controller.dart';
import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:crewin_project/model/userModel.dart';
import 'package:crewin_project/service/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FinishPage extends StatefulWidget {
  const FinishPage({ Key? key }) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  FirebaseFirestore _firestore =FirebaseFirestore.instance;
  FirebaseAuth _auth= FirebaseAuth.instance;
 
 
  var userUid;
  int selectValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userUid = _auth.currentUser!.uid;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "finishPage"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          
          children: [
             
          Container(
            
            height: MediaQuery.of(context).size.height*1.95/3,
            child: StreamBuilder(stream: _firestore.collection("kullanicilar").doc(userUid).snapshots(),
            builder: (BuildContext context,AsyncSnapshot snapshot){

                    if(snapshot.hasData){
                     
                     
                  
                     
                       UserModel kullanici= UserModel(snapshot.data['name'],snapshot.data['gender'],snapshot.data['old'],snapshot.data['lenght'],snapshot.data['weight']);
                     List weightList =kullanici.weight.split("/");
                     List lenghtList =kullanici.lenght.split("/");
                     
                     
                      return Container(
                        
                        decoration:BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        MyText(kullanici.name, 20, Colors.black),
                        MyText(kullanici.gender, 20, Colors.black),
                        MyText(kullanici.old.toString(), 20, Colors.black),
                        MyText(lenghtList[0]+" "+lenghtList[1], 20, Colors.black),
                        MyText(weightList[0]+" "+weightList[1], 20, Colors.black),
                        ],),
                      );

                    }else if(snapshot.hasError){
                      return MyText("data yok", 20, Colors.black);
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
            },
            )
            ),
         // contiuneFunction(context,"FinishPage")
        ],),
      ),
      
    );
}


}