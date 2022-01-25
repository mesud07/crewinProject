
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class  Controller extends ChangeNotifier {



 


  String _name="";
  String _gender="";
  int _year=0;
  String _lenght="";
  String _weight="";

  get getName=>_name;
  get getGender=>_gender;
  get getYear=> _year;
  get getLenght=>_lenght;
  get getWeight=>_weight;

  void addName(String name){
    _name=name;
    print(_name+"eklendi");
    notifyListeners();
  }

  void addGender(String gender){
    _gender=gender;
    print(_gender+"eklendi");
    notifyListeners();
  }

  void addYear(int year){
    _year=year;
    print(_year.toString()+"eklendi");
    notifyListeners();
  }

  void addLenght(String leght){
    _lenght=leght;
    print(_lenght+"eklendi");
    notifyListeners();
  }

  void addWeight(String weight){
    _weight=weight;
    print(_weight+"eklendi");

    notifyListeners();
    
  }

}