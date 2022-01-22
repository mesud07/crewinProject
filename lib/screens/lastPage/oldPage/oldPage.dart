import 'package:crewin_project/helper/appBar.dart';
import 'package:crewin_project/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddOldPage extends StatefulWidget {
  const AddOldPage({ Key? key }) : super(key: key);

  @override
  _AddOldPageState createState() => _AddOldPageState();
}

class _AddOldPageState extends State<AddOldPage> {
  int selectValue = 0;
  List items=[];
  int pageNumber =2;
  @override
  void initState() {
    // TODO: implement initState
    
    listeyeYasEkle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "addYear"),
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
                  child: MyTextWithWeight("How old are you?",Colors.black,20,FontWeight.bold)),

                  SizedBox(height: 250,
                  child: CupertinoPicker(itemExtent: 60,
                  //looping: true,
                  onSelectedItemChanged: (int value) { 
                    setState(() {
                      selectValue=value;
                    });
                   },
                  children: items.map((e) => Center(child: MyText(e.toString(), 30, Colors.black))).toList(),),
                  )

              
      
              ],
            )),
          contiuneFunction(context,"addYear"),
          sliderDat(context,pageNumber)
        ],),
      ),
      
    );
}

void listeyeYasEkle(){
    for(var i =14;i<65;i++)
      {
        items.add(i);
      }
      
    items.add("65+");
    }
}