import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshinv/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:freshinv/features/customerInfo.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.125),
          Align(alignment: Alignment.center,
            child: Expanded(flex: 1, child: Text('Welcome',
                style:TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                )),
          )),
          Align(alignment: Alignment.center,
          child:  Expanded(flex:1, child: Text('What would you like to do?',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),),),),
          SizedBox(height: 75,),
          Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.yellow.shade50,Colors.green.shade900],

          ),
          ),
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.125,
            child:
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/additem');
            },
            child: Text('Add Customer',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),)),
          ),
          SizedBox(height: 20,),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [Colors.yellow.shade50,Colors.green.shade900],
          //
          //     ),
          //   ),
          //   width: MediaQuery.of(context).size.width*.5,
          //   height: MediaQuery.of(context).size.height*.125,
          //   child:
          //   TextButton(onPressed: () {
          //     Navigator.of(context).pushNamed('/removeitem');
          //   }, child: Text('Remove Item',
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: Colors.black
          //   ),)),
          // ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.yellow.shade50,Colors.green.shade900],

              ),
            ),

            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.125,
            child:
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/checkinv');
            }, child: Text('Customer Info',
            style:TextStyle(fontSize: 20,
              color: Colors.black
            ))),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.yellow.shade50,Colors.green.shade900],

              ),
            ),

            width: MediaQuery.of(context).size.width*.25,
            height: MediaQuery.of(context).size.height*.06,
            child:
            TextButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacementNamed('/landingpage');
              }).catchError((e){
                print(e);
              });
            },
              child: Text('Sign Out',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black
            ),)
          )),


        ],
      )


    );
  }
}
