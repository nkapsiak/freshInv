import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshinv/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:freshinv/features/addItem.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.125),
          Align(alignment: Alignment.center,
            child: Expanded(flex: 1, child: Text('Welcome',
                style:TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                )),
          )),
          Align(alignment: Alignment.center,
          child:  Expanded(flex:1, child: Text('What would you like to do?',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),),),),
          SizedBox(height: 100,),
          Container(
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.125,
            child:
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/additem');
            },
            child: Text('Add Item',
            style: TextStyle(
              fontSize: 20,
            ),)),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.125,
            child:
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/removeitem');
            }, child: Text('Remove Item',
            style: TextStyle(
              fontSize: 20,
            ),)),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*.5,
            height: MediaQuery.of(context).size.height*.125,
            child:
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed('/checkinv');
            }, child: Text('Check Inventory',
            style:TextStyle(fontSize: 20,
            ))),
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*.25,
            height: MediaQuery.of(context).size.height*.06,
            child:
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacementNamed('/landingpage');
              }).catchError((e){
                print(e);
              });
            },
              child: Text('Sign Out',
            style: TextStyle(
              fontSize: 16,
            ),),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          ),


        ],
      )


    );
  }
}
