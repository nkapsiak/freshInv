import 'package:flutter/material.dart';
import 'package:freshinv/loginPage.dart';
import 'package:freshinv/main.dart';
import 'package:freshinv/signUp.dart';
import 'package:freshinv/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshinv/features/customerInfo.dart';
import 'dart:async';
import 'package:freshinv/features/Extra/removeItem.dart';
import 'features/checkInv.dart';
import 'package:freshinv/features/style.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUp(),
        '/welcomepage': (BuildContext context) => new welcomePage(),
        '/additem': (BuildContext context) => new AddItem(),
        '/removeitem': (BuildContext context) => new RemoveItem(),
        '/checkinv': (BuildContext context) => new CheckInv(),


      },
    );
  }
}
