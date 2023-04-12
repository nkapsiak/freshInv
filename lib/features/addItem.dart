import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final AnimalController = TextEditingController();
  final AddressController = TextEditingController();
  final KillDateController = TextEditingController();
  final LocationController = TextEditingController();
  final MountStyleController = TextEditingController();


  late DatabaseReference dbRef;




  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Inventory');


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            children: [
        SizedBox(height: 50,),
        Text('Please Enter the Info of the Item',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          )
      ),

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
          controller: FirstNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "First Name",
              prefixIcon: Icon(Icons.branding_watermark),
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
          controller: LastNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Last Name",
              prefixIcon: Icon(Icons.abc_sharp),
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
                  controller: AddressController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Address",
                      prefixIcon: Icon(Icons.abc_sharp),
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
                  controller: AnimalController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Type of Animal",
                      prefixIcon: Icon(Icons.abc_sharp),
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
                  controller: LocationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Location Killed",
                      prefixIcon: Icon(Icons.abc_sharp),
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
                  controller: KillDateController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Kill Date",
                      prefixIcon: Icon(Icons.abc_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width*.5,
                height: MediaQuery.of(context).size.height*.05,
                child:
                ElevatedButton(onPressed: () {
                  Map<String, String> Inventory = {
                    'First Name' : FirstNameController.text,
                    'Last Name' : LastNameController.text,
                    'Animal Type' : AnimalController.text,
                    'Address' : AddressController.text,
                    'Location Killed' : LocationController.text,
                    'Date Killed' : KillDateController.text,

                  };
                  dbRef.push().set(Inventory);
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => AddItem()));
                },
                    child: Text('Add to Inventory',
                  style: TextStyle(
                    fontSize: 20,
                  ),)),
              ),])

    );
  }
}



