import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:freshinv/features/animInfo.dart';
import 'package:freshinv/features/Extra/dropdown.dart';
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
  final DateController = TextEditingController();
  final _controller = TextEditingController();

  DateTime now = new DateTime.now();


  // String? get _errorText{
  // final text = _controller.value.text;
  // if (text.isEmpty){
  //   return "Cannot be Empty";
  // }
  // return null;
  // }
  AnimalLabel? selectedAnimal;



  late DatabaseReference dbRef;




  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Inventory');


  }
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<AnimalLabel>> animalEntries =
    <DropdownMenuEntry<AnimalLabel>>[];
    for (final AnimalLabel animal in AnimalLabel.values) {
      animalEntries.add(DropdownMenuEntry<AnimalLabel>(
          value: animal, label: animal.label));
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Column(
                  children: <Widget>[
              SizedBox(height: 30,),
              Text('Please Enter your Info',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                )
                ),

              SizedBox(height: 20),
              Container(
                child:  Text(
                    '${now.month}/${now.day}/${now.year}'
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //       spreadRadius: 3,
                  //       blurRadius: 5,
                  //       offset: Offset(1, 1),
                  //       color: Colors.grey.withOpacity(0.4)
                  //   )
                  // ]
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text){
                  if (text == null || text.isEmpty){
                    return "Cannot be Empty";
                  }
                  return null;
                },
                controller: FirstNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // errorText: _errorText,
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
                  // boxShadow: [
                  //   BoxShadow(
                  //       spreadRadius: 3,
                  //       blurRadius: 5,
                  //       offset: Offset(1, 1),
                  //       color: Colors.grey.withOpacity(0.4)
                  //   )
                  // ]
              ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Cannot be Empty";
                    }
                    return null;
                  },
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
                          // boxShadow: [
                          //   BoxShadow(
                          //       spreadRadius: 3,
                          //       blurRadius: 5,
                          //       offset: Offset(1, 1),
                          //       color: Colors.grey.withOpacity(0.4)
                          //   )
                          // ]
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text){
                          if (text == null || text.isEmpty){
                            return "Cannot be Empty";
                          }
                          return null;
                        },
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
                          // boxShadow: [
                          //   BoxShadow(
                          //       spreadRadius: 3,
                          //       blurRadius: 5,
                          //       offset: Offset(1, 1),
                          //       color: Colors.grey.withOpacity(0.4)
                          //   )
                          // ]
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text){
                          if (text == null || text.isEmpty){
                            return "Cannot be Empty";
                          }
                          return null;
                        },
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
                        // boxShadow: [
                        //   BoxShadow(
                        //       spreadRadius: 3,
                        //       blurRadius: 5,
                        //       offset: Offset(1, 1),
                        //       color: Colors.grey.withOpacity(0.4)
                        //   )
                        // ]
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (text){
                          if (text == null || text.isEmpty){
                            return "Cannot be Empty";
                          }
                          return null;
                        },
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.yellow.shade50,Colors.green.shade900],

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DropdownMenu<AnimalLabel>(
                              controller: AnimalController,
                              label: Text('Animal'),
                              dropdownMenuEntries: animalEntries,
                              onSelected: (AnimalLabel? animal) {
                                setState(() {
                                  selectedAnimal = animal;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
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
                      height: MediaQuery.of(context).size.height*.05,
                      child:
                      TextButton(onPressed: () {
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
                          color: Colors.black
                        ),)),
                    ),]),
            ),
          ),
        )

    );
  }
}
enum AnimalLabel {
  blue('Deer  ', Colors.blue),
  pink('Bear  ', Colors.pink),
  green('Coyote', Colors.green);


  const AnimalLabel(this.label, this.animal);
  final String label;
  final Color animal;
}