import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:flutter/material.dart';
class AddGenderPage extends StatefulWidget {
  const AddGenderPage({ Key? key }) : super(key: key);

  @override
  _AddGenderPageState createState() => _AddGenderPageState();
}

class _AddGenderPageState extends State<AddGenderPage> {
  int genderIndex = 2;
  int pageNumber =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "addGender"),
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
                  child: MyTextWithWeight("What is your sex?",Colors.black,20,FontWeight.bold)),

                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        selectGender(context,Icons.female,0),
                        selectGender(context,Icons.male,1)
                      ],
                    ),
                    
                  ],)
              
      
              ],
            )),
          contiuneFunction(context,"addGender"),
          sliderDat(context,pageNumber)
        ],),
      ),
      
    );
}

  InkWell selectGender(BuildContext context,IconData icon,int index) {
    return InkWell(
                    onTap: (){
                    setState(() {
                      genderIndex=index;
                    });
                    },
                    child: Column(
                      children: [
                        Container(
                          
                          height: 150,
                          width: MediaQuery.of(context).size.width*4/10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                        BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                          ),
                          ],
                            color: Colors.white),
                          child: Icon(icon,size: 150,
                          color: 
                          genderIndex==index && icon==Icons.female?Colors.red:
                          genderIndex==index && icon==Icons.male?Colors.black:Colors.grey),
                  
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: MyText(index==0?"Woman":"Men", 15,Colors.grey ),)
                      ],
                    ),
                  );
  }}