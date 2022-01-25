import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewin_project/controller/controller.dart';
import 'package:crewin_project/helper/style.dart';
import 'package:crewin_project/screens/addGenderPage/addGenerate.dart';
import 'package:crewin_project/screens/addNamePage/addName.dart';
import 'package:crewin_project/screens/finishPage/finishPage.dart';
import 'package:crewin_project/screens/lastPage/lenghtPage/lenghtPage.dart';
import 'package:crewin_project/screens/lastPage/oldPage/oldPage.dart';
import 'package:crewin_project/screens/lastPage/weightPage/weightPage.dart';
import 'package:crewin_project/screens/signInUpPage/signInUp.dart';
import 'package:crewin_project/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';
MyText(String text,double size,Color color,){
  
  return Text(text,style: GoogleFonts.poppins(fontSize: size,color: color,));
}


  Container contiuneFunction(BuildContext context,String pageName,String gelenDeger) {
    FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
    FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
    Controller _controller =Controller();
    Auth _auth =Auth();
    return Container(
      
          height: MediaQuery.of(context).size.height/13,
          margin: EdgeInsets.only(left: 20,right: 20,),
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: backgroundColor,
                    ),
                    onPressed: 
                    
                    
                    pageName=="addName"?(){

                
    if (gelenDeger=="") {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          
          content: MyText("Please writing your name", 20, Colors.white)),
      );
    }else{
                      context.read<Controller>().addName(gelenDeger);
                      Get.to(()=>AddGenderPage(),transition: Transition.fadeIn);
    }
                     
                    }:
                    pageName=="addGender"?(){
                      if (gelenDeger=="") {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          
          content: MyText("Please select your gender", 20, Colors.white)),
      );
    }else{
 context.read<Controller>().addGender(gelenDeger);
                      
                      Get.to(()=>AddOldPage(),transition: Transition.fadeIn);
    }
                      
                    }:
                    pageName=="addYear"?(){
                      
                       if (gelenDeger=="") {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          
          content: MyText("Please select your gender", 20, Colors.white)),
      );
    }else{

      context.read<Controller>().addYear(int.parse(gelenDeger));
                      Get.to(()=>AddLenghtPage(),transition: Transition.fadeIn);
    }
                       
                    }:
                    pageName=="addLenght"?(){
                       context.read<Controller>().addLenght(gelenDeger);
                      Get.to(()=>AddWeightPage(),transition: Transition.fadeIn);
                      
                        }:
                    pageName=="addWeight"?(){
                     context.read<Controller>().addWeight(gelenDeger);
                     _auth.sendUserInfo(context);
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>FinishPage()));

                      
                    }:
                    pageName=="landing"?(){
                      Get.to(()=>SignInUpPage(),transition: Transition.fadeIn);
                    }:
                    null
                    
                    ,
                    
                     child: Container(
                      
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: MyText(pageName=="signUp"||pageName=="signIn"||pageName=="addName"?"Contiune":
                      pageName=="addGender"||pageName=="addLenght"||pageName=="addWeight"||pageName=="addYear"?"Next":"Contiune without signing up", 16, Colors.white))),
        );
  }
class MyTextWithWeight extends StatelessWidget {
 String _text;
 Color _color;
 double _fontSize;
 FontWeight _fontWeight;
 MyTextWithWeight(this._text,this._color,this._fontSize,this._fontWeight);

  @override
  Widget build(BuildContext context) {
    return Text(_text,style: GoogleFonts.openSans(color: _color,fontSize: _fontSize, fontWeight: _fontWeight),);
  }
}




Container sliderDat(BuildContext context,int pageNumber ){
    return Container(
         
          height: MediaQuery.of(context).size.height/17,
          //color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            for(var i =1;i<5;i++)
            Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    color:pageNumber==i?Colors.black:Colors.grey
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
            
          ],),
        );
  }
