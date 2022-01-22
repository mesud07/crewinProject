import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FinishPage extends StatefulWidget {
  const FinishPage({ Key? key }) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  int selectValue = 0;
  List items=[];
  
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
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  
                  margin: EdgeInsets.only(bottom: 40),
                  child: MyTextWithWeight("Finish Page",Colors.black,20,FontWeight.bold)),


              
      
              ],
            )),
         // contiuneFunction(context,"FinishPage")
        ],),
      ),
      
    );
}


}