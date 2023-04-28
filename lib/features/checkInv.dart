import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
          onPressed: (){ _createPdf(inventory: inventory);
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
Future<void> _createPdf({required Map inventory}) async{
  Query dbRef = FirebaseDatabase.instance.ref().child('Inventory');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Inventory');

  final PdfDocument document = PdfDocument();
  final PdfPage page = document.pages.add();
  // final PdfLayoutResult layoutResult20 = page.graphics.drawImage(PdfBitmap(await _readImageData('Picture1.png')), Rect.fromLTWH(200, 50, 200, 200));
  final PdfLayoutResult layoutResult = PdfTextElement(
      text: "Todays Date",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 0, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult1 = PdfTextElement(
      text: "Supplier Name",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 15, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult2 = PdfTextElement(
      text: "Supplier Address",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 30, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult3 = PdfTextElement(
      text: "Supplier Contact Information",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 45, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult7 = PdfTextElement(
      text: 'Customer Information',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 90, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult8 = PdfTextElement(
      text: '------------------------------------------------------------------------------------------------------------',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 105, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

  final PdfLayoutResult layoutResult4 = PdfTextElement(
    text: inventory['First Name'],
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
    page: page,
    bounds: Rect.fromLTWH(
        0, 120, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult5 = PdfTextElement(
      text: inventory['Last Name'],
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          50, 120, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult6 = PdfTextElement(
      text: inventory['Address'],
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 135, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult9 = PdfTextElement(
      text: inventory['Animal Type'],
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 150, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult12 = PdfTextElement(
      text: "Quoted Price: ____________",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 500, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult13 = PdfTextElement(
      text: "Required deposit : \$200",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 515, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult14 = PdfTextElement(
      text: "Remaining Balance: ______________",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 530, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult10 = PdfTextElement(
      text: 'Customer Signature',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 600, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;
  final PdfLayoutResult layoutResult11 = PdfTextElement(
      text: "________________________________________",
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush:PdfSolidBrush(PdfColor(0, 0, 0))).draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, 650, page.getClientSize().width, page.getClientSize().height),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

  //
  // PdfGrid grid = PdfGrid();
  //
  // grid.columns.add(count: 3);
  // grid.headers.add(1);
  //
  // PdfGridRow header = grid.headers[0];
  // header.cells[0].value = 'Customer info';
  // header.cells[1].value = Text(inventory['First Name']);
  //
  // PdfGridRow row = grid.rows.add();
  // row.cells[0].value = Text(inventory['First Name']);
  // row.cells[1].value = ' ';
  // row.cells[2].value = ' ';
  //
  // grid.draw(page: document.pages.add(),
  // bounds: const Rect.fromLTWH( 0, 0, 0, 0));



  List<int> bytes = await document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}
// Future<Int8List> _readImageData(String name)async{
//   final data = await rootBundle.load('images/$name');
//   return data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
//
//
// }