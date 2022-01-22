import 'package:crewin_project/helper/style.dart';
import 'package:crewin_project/screens/addGenderPage/addGenerate.dart';
import 'package:crewin_project/screens/addNamePage/addName.dart';
import 'package:crewin_project/screens/finishPage/finishPage.dart';
import 'package:crewin_project/screens/lastPage/lenghtPage/lenghtPage.dart';
import 'package:crewin_project/screens/lastPage/oldPage/oldPage.dart';
import 'package:crewin_project/screens/lastPage/weightPage/weightPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
MyText(String text,double size,Color color,){
  
  return Text(text,style: GoogleFonts.poppins(fontSize: size,color: color,));
}


  Container contiuneFunction(BuildContext context,String pageName) {
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
                    pageName=="signUp"?(){
                      //print("kayıt olundu");
                      Get.to(()=>AddNamePage(),transition: Transition.fadeIn);
                    }:
                    pageName=="signIn"?(){
                      //print("Giriş Yapıldı");
                      Get.to(()=>AddNamePage(),transition: Transition.fadeIn);
                    }:
                    pageName=="addName"?(){
                      Get.to(()=>AddGenderPage(),transition: Transition.fadeIn);
                    }:
                    pageName=="addGender"?(){
                      Get.to(()=>AddOldPage(),transition: Transition.fadeIn);
                    }:
                    pageName=="addYear"?(){
                      Get.to(()=>AddLenghtPage(),transition: Transition.fadeIn);
                    }:
                    pageName=="addLenght"?(){
                      Get.to(()=>AddWeightPage(),transition: Transition.fadeIn);
                        }:
                    pageName=="addWeight"?(){
                      Get.to(()=>FinishPage(),transition: Transition.fadeIn);
                    }:
                    null
                    
                    ,
                    
                     child: Container(
                      
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: MyText("Contiune", 16, Colors.white))),
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
