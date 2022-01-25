import 'package:crewin_project/controller/controller.dart';
import 'package:crewin_project/helper/style.dart';
import 'package:crewin_project/screens/addNamePage/addName.dart';
import 'package:crewin_project/screens/finishPage/finishPage.dart';
import 'package:crewin_project/screens/landingPage/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'screens/signInUpPage/signInUp.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  

  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:Controller()),
      ],
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
      primaryColor: Colors.red
      ),
      home: SignInUpPage(),
    );
  }
}

