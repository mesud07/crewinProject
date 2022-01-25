import 'package:flutter/material.dart';


import 'helper.dart';
PreferredSizeWidget header (BuildContext context,String name,){
  
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title:Container(
       // alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20),
        child: Container(
                        margin: const EdgeInsets.only(top: 7,),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //Container(
            //  height: 50,
            //  width: 50,
            //  decoration: const BoxDecoration(
             // color: Colors.red,

            //    image: DecorationImage(
            //    fit: BoxFit.contain,
            //    image: AssetImage("assets/images/birlik_logosu.png"))),),
              

          ],),
        ),
      ),
      //leading: Icon(Icons.directions_railway_filled_rounded,color: Colors.black,),
      actionsIconTheme: const IconThemeData(
            size: 30.0,
            color: Colors.white,
            opacity: 10.0
  ),
  //actions: name!="homePage"? [
  //  IconButton(
  //    icon:Icon(Icons.menu),onPressed: (){
  //      Scaffold.of(context).openDrawer();
  //    },)
  //]:null,
  leading: 
  name!="addName"?IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black,),
  
 onPressed: (){
   Navigator.pop(context);
  },):null,

   
      ),
  );
}