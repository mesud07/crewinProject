import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:crewin_project/screens/signInUpPage/signInUp.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({ Key? key }) : super(key: key);

  @override
  _AddNamePageState createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "addName"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          
          children: [
             
          Container(
            
            height: MediaQuery.of(context).size.height*1.95/3,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 40),
                  child: MyTextWithWeight("Your Name?",Colors.black,30,FontWeight.bold)),
                Container(
        height: 50,
        child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                  hintText: "Your Name"
          
          ),
          validator:(value){
            value!.length>6? null : "hata";
          },
        ),
      ),
              ],
            )),
          contiuneFunction(context,"addName")
        ],),
      ),
      
    );
  }
}