import 'package:flutter/material.dart';
import 'package:freshinv/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshinv/role_base_auth/services/user_management.dart';
import 'package:freshinv/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  String adminEmail = "";
  String adminPassword = "";


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children:[
          SizedBox(height: 30,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Text('Sign Up Page',
                    style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    )
                ),
                SizedBox(height: 10,),
                Text("Account Creation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.4)
                        )
                      ]
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        adminEmail = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Email ID",
                        prefixIcon: Icon(Icons.email_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.grey),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(1,1),
                            color: Colors.grey.withOpacity(0.4)
                        )
                      ]
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        adminPassword = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.grey),
                        )
                    ),
                  ),
                ),
                ButtonBar(children: [
                  Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.yellow.shade50,Colors.green.shade900],
                    )),
                    child: TextButton(style: TextButton.styleFrom(
                        foregroundColor: Colors.black) ,
                        onPressed: () {
                          Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        } , child: Text('Back')),
                  ),
                  Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.yellow.shade50,Colors.green.shade900],
                      )),
                    child: TextButton(style: TextButton.styleFrom(
                      foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: adminEmail,
                          password: adminPassword).then((signedInUser){
                            UserManagement().storeNewUser(signedInUser, context);


                      }).catchError((e){
                        print(e);
                      });
                    },
                        child: Text('Create Account')
                    ),
                  ),
                ],),
                // Container(child:
                // Image.asset("images/AccountCreation.png",fit: BoxFit.fill,)
                // ),


              ],),
          ),

          // ),),


        ],
      ),
    );

    return const Placeholder();
  }
}
