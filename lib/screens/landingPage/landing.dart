import 'package:crewin_project/helper/helper.dart';
import 'package:flutter/material.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String description ="Gençleştiriciye hoşgeldiniz.";
  double uzunluk=100;
  double genislik=100;
  String image = "assets/facebook_logo.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Container(
          height: MediaQuery.of(context).size.height/4,
          //color: Colors.red,
        ),

        Container(
          
          height: 150,
          width: 200,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/fitnesslogojpg.jpg"))),
        ),
        Container(
          
          margin: EdgeInsets.only(top: 10,bottom: 60),
          child: MyTextWithWeight(description,Colors.black,20,FontWeight.bold),),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          height: MediaQuery.of(context).size.height/4,
          width: double.infinity,
          padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.email,size: 35,)),
            MyImageIcon(uzunluk: 45, genislik: 40, image: "assets/google.png",onTap: (){},),

           MyImageIcon(uzunluk: 50, genislik: 40, image: image,onTap: (){},),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: contiuneFunction(context,"landing","")),
        
        
      ],),
      
    );
  }
}

class MyImageIcon extends StatelessWidget {
  const MyImageIcon({
    Key? key,
    required this.uzunluk,
    required this.genislik,
    required this.image,
    required this.onTap
  }) : super(key: key);

  final double uzunluk;
  final double genislik;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
       height: uzunluk,
       width: genislik,
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image))),
            ),
    );
  }
}