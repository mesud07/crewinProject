import 'package:crewin_project/controller/controller.dart';
import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:crewin_project/helper/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
class AddGenderPage extends StatefulWidget {
  const AddGenderPage({ Key? key }) : super(key: key);

  @override
  _AddGenderPageState createState() => _AddGenderPageState();
}

class _AddGenderPageState extends State<AddGenderPage> {
  Controller _controller = Controller();
  
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
                //MyText(context.watch<Controller>().getName!=null?context.watch<Controller>().getName:"null değer", 30, Colors.black),
                Container(
                  
                  margin: EdgeInsets.only(bottom: 40),
                  child: MyTextWithWeight("What is your sex?",Colors.black,20,FontWeight.bold)),

                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        selectGender(context,Icons.female,0,"female"),
                        selectGender(context,Icons.male,1,"male")
                      ],
                    ),
                    
                  ],)
              
      
              ],
            )),
        contiuneFunction(context,"addGender",context.watch<Controller>().getGender=="female"?"female":context.watch<Controller>().getGender=="male"?"male":""),
            //nextButton(context),

          sliderDat(context,pageNumber)
        ],),
      ),
      
    );
}




  Container nextButton(BuildContext context) {
    return Container(
    
        height: MediaQuery.of(context).size.height/13,
        margin: EdgeInsets.only(left: 20,right: 20,),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                  ),
                  onPressed: (){
                   //context.read<Controller>().
                  },
                  
                   child: Container(
                    
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: MyText("Next", 16, Colors.white))),
      );
  }

  InkWell selectGender(BuildContext context,IconData icon,int index,String deger) {
    return InkWell(
                    onTap: (){
                    setState(() {
                      context.read<Controller>().addGender(deger);
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
                           context.watch<Controller>().getGender==deger && icon==Icons.female?Colors.red:
                          context.watch<Controller>().getGender== deger && icon==Icons.male?Colors.black:Colors.grey),
                  
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: MyText(index==0?"Woman":"Men", 15,Colors.grey ),)
                      ],
                    ),
                  );
  }}