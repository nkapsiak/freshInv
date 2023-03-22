import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final brandNameController = TextEditingController();
  final modelNameController = TextEditingController();
  final macNumberController = TextEditingController();

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
          controller: brandNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Brand Name",
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
          controller: modelNameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Model",
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
                  controller: macNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Mac Number",
                      prefixIcon: Icon(Icons.abc_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      )
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.5,
                height: MediaQuery.of(context).size.height*.05,
                child:
                ElevatedButton(onPressed: () {
                  Map<String, String> Inventory = {
                    'brand' : brandNameController.text,
                    'model' : modelNameController.text,
                    'mac number' : macNumberController.text,
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



