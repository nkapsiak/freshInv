import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:freshinv/features/pdf.dart';



class CheckInv extends StatefulWidget {
  const CheckInv({Key? key}) : super(key: key);

  @override
  State<CheckInv> createState() => _CheckInvState();
}

class _CheckInvState extends State<CheckInv> {

  final searchFilter = TextEditingController();
  DateTime now = new DateTime.now();

  Query dbRef = FirebaseDatabase.instance.ref().child('Inventory');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Inventory');

  Widget listItem({required Map inventory}) {
    return Container(
        margin: EdgeInsets.all(7.5),
        padding: EdgeInsets.all(7.5),
        height: 131,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.yellow.shade50,Colors.green.shade900],

        ),
      ),
        child: TextButton(style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black),
          onPressed: (){ _createPdf();
          },

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 250,),
                  GestureDetector(
                  onTap: () {
                    reference.child(inventory['key']).remove();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.delete,color: Colors.black,size: 20,),
                    ],
                  ))

                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Text( inventory['First Name'],
                  style: TextStyle(fontSize: 12)),
                  SizedBox(width: 2,),
                  Text(
                    inventory['Last Name'],
                    style: TextStyle(fontSize: 12),),
                ],
              ),
            SizedBox(height: 3,),
            Text(
              inventory['Address'],
              style: TextStyle(fontSize: 12),

            ),
              SizedBox(height: 3,),
              Text(
                inventory['Animal Type'],
                style: TextStyle(fontSize: 12),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         reference.child(inventory['key']).remove();
              //       },
              //       child: Row(
              //         children: [
              //           Icon(Icons.delete,color: Colors.black,size: 20,),
              //         ],
              //       ))
              //       ],
              //     )
                ],
              )
          ),
        );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: const Text('Fetching data'),
      // ),
      body: Column(
          children: [
            SizedBox(height: 50),
            Expanded(child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map inventory = snapshot.value as Map;
                  inventory['key'] = snapshot.key;

                  return listItem(inventory: inventory);
                })


            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.yellow.shade50,Colors.green.shade900],

                ),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black),
                  onPressed: () {
                Navigator.of(context).pushNamed('/welcomepage');
              }, child: Text("Back")),
            )
          ]),
    );
  }

  }
Future<void> _createPdf() async{
  Query dbRef = FirebaseDatabase.instance.ref().child('Inventory');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Inventory');

  PdfDocument document = PdfDocument();

  PdfGrid grid = PdfGrid();

  grid.columns.add(count: 3);
  grid.headers.add(1);

  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'Customer info';

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = {''};
  row.cells[1].value = ' ';
  row.cells[2].value = ' ';

  grid.draw(page: document.pages.add(),
  bounds: const Rect.fromLTWH( 0, 0, 0, 0));



  List<int> bytes = await document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}