import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class CheckInv extends StatefulWidget {
  const CheckInv({Key? key}) : super(key: key);

  @override
  State<CheckInv> createState() => _CheckInvState();
}

class _CheckInvState extends State<CheckInv> {

  final searchFilter = TextEditingController();

  Query dbRef = FirebaseDatabase.instance.ref().child('Inventory');

  Widget listItem({required Map inventory}) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 75,
        color: Colors.blue,
        child: FilledButton(onPressed: (){},

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(
            inventory['First Name'],
              style: TextStyle(fontSize: 12)),
            SizedBox( height: 5),
            Text(
            inventory['Last Name'],
            style: TextStyle(fontSize: 12),),
            SizedBox(height: 5,),
            Text(
              inventory['Animal Type'],
              style: TextStyle(fontSize: 12),
            )
          ]),
        ),

        );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Fetching data'),
      ),
      body: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map inventory = snapshot.value as Map;
                  inventory['key'] = snapshot.key;

                  return listItem(inventory: inventory);
                })


            ),
          ]),
    );
  }

  }
