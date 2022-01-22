import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddWeightPage extends StatefulWidget {
  const AddWeightPage({ Key? key }) : super(key: key);

  @override
  _AddWeightPageState createState() => _AddWeightPageState();
}

class _AddWeightPageState extends State<AddWeightPage> {
  int selectValue = 0;
  List items=[];
  int pageNumber =4;
  @override
  void initState() {
    // TODO: implement initState
    
    listeyeKiloEkle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "addLenght"),
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
                  child: MyTextWithWeight("How much is your weight?",Colors.black,20,FontWeight.bold)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    children: [
                      Container(height: 250,
                      alignment: Alignment.centerRight,
                      width: 150,
                      child: CupertinoPicker(itemExtent: 60,
                     // magnification: 1.2,
                     //  backgroundColor: Colors.black87,
                      
                      //looping: true,
                      onSelectedItemChanged: (int value) { 
                        setState(() {
                          selectValue=value;
                        });
                       },
                      children: items.map((e) => Center(child:MyText(e.toString(), 27, Colors.black))).toList(),),
                      ),

              SizedBox(
                  height: 250,
                  width: 100,
                  child: CupertinoPicker(itemExtent: 60,
                  //looping: true,
                  onSelectedItemChanged: (int value) { 
                    setState(() {
                      selectValue=value;
                    });
                   },
                  children: [
                    Center(child: Text("kg")),
                    
                    
                  ]),
                  )
                    ],
                  ),
                   

              
      
              ],
            )),
          contiuneFunction(context,"addWeight"),
          sliderDat(context,pageNumber)
        ],),
      ),
      
    );
}

  

void listeyeKiloEkle(){
    for(var i =50;i<140;i++)
      {
        items.add(i);
      }
      
    items.add("140+");
    }
}