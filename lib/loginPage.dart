import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshinv/loginPage.dart';
import 'package:freshinv/signUp.dart';
import 'package:freshinv/welcomePage.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),

              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text('Login Page',
                        style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        )
                    ),
                    SizedBox(height: 10,),
                    Text("Sign into your account",
                      style: TextStyle(
                        fontSize: 16,
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
                                offset: Offset(1, 1),
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
                                offset: Offset(1, 1),
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
                        obscureText: true,
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
                    SizedBox(height: 10,),
                    Row(
                      children: [
                         Container(
                           width: 110,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/signup');
                                }, child: Text("Sign Up"),),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.yellow.shade50,Colors.green.shade900],

                              ),
                            )),
                  //       ElevatedButton(
                  //           style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,
                  //           foregroundColor: Colors.black),
                  //             onPressed: () {
                  //               Navigator.of(context).pushNamed('/signup');
                  //             },
                  //             child: Container(
                  //               child: Text("Sign up"),
                  //               decoration: BoxDecoration(
                  //                   gradient: LinearGradient(
                  //                     begin: Alignment.topLeft,
                  //                     end: Alignment.bottomRight,
                  //                     colors: [Colors.blue,Colors.green],
                  //             )),
                  //       //   decoration: BoxDecoration(
                  //       //       gradient: LinearGradient(
                  //       //         begin: Alignment.topLeft,
                  //       //         end: Alignment.bottomRight,
                  //       //         colors: [Colors.blue,Colors.green],
                  //       // )
                  //
                  //   ),
                  // ),

                        SizedBox(width: 5),
                        Container(
                          width: 110,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black),
                              onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: adminEmail, password: adminPassword
                            ).then((user) {
                              Navigator.of(context).pushReplacementNamed('/welcomepage');
                            }).catchError((e){
                              print(e);
                            });
                          },
                              child: Text('Sign In')),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.yellow.shade50,Colors.green.shade900],

                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        // Container(
                        //     child: TextButton(
                        //       style: TextButton.styleFrom(
                        //           backgroundColor: Colors.transparent,
                        //           foregroundColor: Colors.black),
                        //       onPressed: () {},
                        //       child: Text("Forgot Password"),),
                        //
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       gradient: LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.bottomRight,
                        //         colors: [Colors.yellow.shade50,Colors.green.shade900],
                        //
                        //       ),
                        //     )),

                      ],
                    ),

                    // Container(child:
                    // Image.asset("images/Inventory2.png", fit: BoxFit.fill,)
                    // ),


                  ],),
              ),

              // ),),


            ],
          ),
        ),
      ),
    );

    return const Placeholder();
  }
}