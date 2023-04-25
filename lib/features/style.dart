import 'package:flutter/material.dart';
import 'package:freshinv/loginPage.dart';
import 'package:freshinv/main.dart';
import 'package:freshinv/signUp.dart';
import 'package:freshinv/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freshinv/features/customerInfo.dart';
import 'dart:async';
import 'package:freshinv/features/Extra/removeItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class style extends StatefulWidget {
  const style({Key? key}) : super(key: key);

  @override
  State<style> createState() => _styleState();
}

class _styleState extends State<style> {

   List<dynamic> animals = [];
   List<dynamic> mountStyle = [];
   List<dynamic> earStyle = [];

   String? animalId;
   String? mountId;

   late DatabaseReference dbRef;

  set falseHope(String? falseHope) {
    falseHope = this.animalId;
  }



  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Inventory');



  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
            SizedBox(height: 10,),
            Container(
                child: FormHelper.dropDownWidget(
                  context,
                  "Select Animal",
                  this.animalId,
                  this.animals,
                  (onChangedVal){
                  this.animalId = onChangedVal;
                  falseHope = this.animalId;
                  },
                  (onValidateVal){
                  if (onValidateVal == null){
                  return "Please Select Animal";
                  }
                  return null;
                  },
                  borderColor: Colors.black,
                  borderRadius: 10,
                  optionValue: "id",
                  optionLabel: "label",
                  )
                ),
              ],
            ),
          );
  }
}




