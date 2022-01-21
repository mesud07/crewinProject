import 'package:crewin_project/helper/style.dart';
import 'package:flutter/material.dart';
class SignInUpPage extends StatefulWidget {
  const SignInUpPage({ Key? key }) : super(key: key);

  @override
  _SignInUpPageState createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  late String userName,email,password;
  var _key = GlobalKey<FormState>();
  bool kayitDurumu = false;
  TextEditingController _mailController = TextEditingController();
  bool girismi = false;
  List<bool> isSelected = [true, false];
  String emailTitle = "Email";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(

      
        
        children: [
         
          switchButton(),
          Form(
            key: _key,
            child: Container(
              margin: EdgeInsets.all(20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!isSelected[1])
                  MyTextFormField("Mail",_mailController),
                  
                  
                  SizedBox(height: 20,),
                  MyTextFormField("password",_mailController),
                  SizedBox(height: 20,),
                  MyTextFormField("re-password",_mailController),
                  SizedBox(height: 20,),
                  InkWell(

                      onTap: (){
                      

                      },
                      child: Text("giris yap kayıt ol"),
                  ),


                  GestureDetector(
                    onTap: (){
                  
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(" Zaten Hesabım Var",style: TextStyle(fontSize: 17, color: Colors.red)),
                    ),
                  )

                ],
              ),
            ))
        ],
      ),
    );
  }

  Container switchButton() {
    return Container(
     
          width: double.infinity,
          margin: EdgeInsets.only(left: 45,right: 45,top: 100,bottom: 50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          child: ToggleButtons(

            isSelected: isSelected,
            selectedColor: Colors.black,
            color: Colors.white,
            //fillColor: Colors.orangeAccent,
            renderBorder: false,
            //splashColor: Colors.red,
            //highlightColor: Colors.orange,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                   padding: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: isSelected[0]==true?Colors.white:backgroundColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('SIGN UP', style: TextStyle(fontSize: 18))),
              ),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  padding: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: isSelected[1]==true?Colors.white:backgroundColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:Text('SIGN IN', style: TextStyle(fontSize: 18))),
              ),
            ],
            onPressed: (int newIndex) {
              setState(() {
                for (int index = 0; index < isSelected.length; index++) {
                  if (index == newIndex) {
                    isSelected[index] = true;
                  } else {
                    isSelected[index] = false;
                  }
                }
              });
            },
          ),
        );
  }
}

class MyTextFormField extends StatelessWidget {
  MyTextFormField(this.title,this.controller);

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(title,),),
            
      TextFormField(
        controller: controller,
        
        decoration: InputDecoration(

           border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2))
        
        ),
        validator:(value){
          value!.length>6? null : "hata";
        },
      ),
      ],
    );
  }
}