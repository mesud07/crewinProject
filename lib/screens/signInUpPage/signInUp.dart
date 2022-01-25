import 'package:crewin_project/helper/helper.dart';
import 'package:crewin_project/helper/style.dart';
import 'package:crewin_project/screens/addNamePage/addName.dart';
import 'package:crewin_project/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
class SignInUpPage extends StatefulWidget {
  const SignInUpPage({ Key? key }) : super(key: key);

  @override
  _SignInUpPageState createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  Auth _auth = Auth();
  late String userName,email,password;
  var _key = GlobalKey<FormState>();
  bool kayitDurumu = false;
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  bool girismi = false;
  List<bool> isSelected = [true, false];
  String emailTitle = "Email";

  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(

        children: [
          switchButton(),
          Container(
            height: MediaQuery.of(context).size.height*1.7/3,
            child: Form(
              key: _key,
              child: Container(
                margin: EdgeInsets.all(20),
            
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   
                    MyTextFormField("Email",_mailController,TextInputType.emailAddress),
                    
                    
                    SizedBox(height: 20,),
                    MyTextFormField(isSelected[1]==false?"Create Password":"Password",_passwordController,TextInputType.text),
                    SizedBox(height: 20,),
                     if(!isSelected[1])
                    MyTextFormField("Re-write Password",_repasswordController,TextInputType.text),
                    if(!isSelected[1])
                    SizedBox(height: 10,),
            
                   
                    isSelected[1]==false?
                      privacyNotice()
                     :GestureDetector(
                       onTap: (){},
                       child: Text("Forgot Password?",style: GoogleFonts.poppins(decoration: TextDecoration.underline,fontSize: 15,color: Colors.black,),
                     )),
                     
                   
            
                  
            
                  ],
                ),
              )),
          ),
          Container(
      
          height: MediaQuery.of(context).size.height/13,
          margin: EdgeInsets.only(left: 20,right: 20,),
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: backgroundColor,
                    ),
                    onPressed: (){
                     
  

                if(isSelected[1]==false){
                      _auth.createUser(_mailController.text, _passwordController.text).whenComplete(
                          () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddNamePage()), (route) => false));
                      
                      }else{
                        _auth.signIn(_mailController.text, _passwordController.text).whenComplete(
                          () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddNamePage()), (route) => false));
                          print("giriş yapıldı");
                      }
    
  
                      
                    
                    },
                    
                     child: Container(
                      
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: MyText(isSelected[1]==false ? "Sign Up":"Sign In", 16, Colors.white))),
        ),
        ],
      ),
    );
  }





  Container privacyNotice() {
    return Container(
                  constraints:BoxConstraints(minWidth: 100, maxWidth: 300),
                  child: RichText(text: TextSpan(children: [

                    TextSpan(text:"Curabitur lobortis id lorem id bibendum,Ut id consectetur magna. ",style: GoogleFonts.poppins(fontSize: 12,color:Colors.grey), ),
                    TextSpan(text: "Terms of Use",style: GoogleFonts.poppins(fontSize: 12,color:Colors.blue,decoration: TextDecoration.underline,)),
                    TextSpan(text: " augue enim pulvinar ",style: GoogleFonts.poppins(fontSize: 12,color:Colors.grey)),
                    TextSpan(text: "Privacy Notice",style: GoogleFonts.poppins(fontSize: 12,color:Colors.blue,decoration: TextDecoration.underline,)),
                    TextSpan(text: " lacinia at.",style: GoogleFonts.poppins(fontSize: 12,color:Colors.grey)),

                  ]),)

                );
  }




  Container switchButton() {
    return Container(
     
          width: double.infinity,
          margin: EdgeInsets.only(left: 50,right: 50,top: 100,bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          child: ToggleButtons(
            fillColor: Colors.transparent,
            isSelected: isSelected,
            selectedColor: Colors.black,
            color: Colors.white,
            //fillColor: Colors.orangeAccent,
            renderBorder: false,
            splashColor: Colors.transparent,
            //highlightColor: Colors.orange,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top:2,bottom: 2),
                child: Container(
                   padding: EdgeInsets.only(left:45,right: 45,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: isSelected[0]==true?Colors.white:backgroundColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("SIGNUP",style: GoogleFonts.poppins(fontSize: 17,),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,bottom: 2),
                child: Container(
                  
                  padding: EdgeInsets.only(left:40,right: 40,top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      color: isSelected[1]==true?Colors.white:backgroundColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:Text('SIGN IN',style: GoogleFonts.poppins(fontSize: 17,))),
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

class MyTextFormField extends StatefulWidget {
  MyTextFormField(this.title,this.controller,this.keyboardType);

  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool passwordHidden=false;
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: MyText(widget.title,17,Colors.black)),
            
      Container(
        
        height: 50,
        child: TextFormField(
          
                  keyboardType: widget.keyboardType,
          controller: widget.controller,
           onSaved: (String? value) {
                          print("selam");},
          obscureText: 
          widget.title=="Re-write Password"&&passwordHidden==false||widget.title=="Password"&&passwordHidden==false||widget.title=="Create Password"&&passwordHidden==false?true:false,
          
          decoration: InputDecoration(
            
             border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2)),
                suffixIcon: widget.title=="Password"||widget.title=="Create Password"||widget.title=="Re-write Password"?IconButton(
                    icon: Icon(
                        passwordHidden ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                     setState(() {
                       passwordHidden= !passwordHidden;
                     });
                    }):null
          
          ),
          validator: (value){
            if(widget.title=="Email"){
            if(value!.contains('@')){
              return null;
            }else{
              return "doğru giriniz";
            }}
          },
        ),
      ),
      ],
    );
  }
}