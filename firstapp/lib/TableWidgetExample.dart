import 'package:flutter/material.dart';

class TableWidgetExample extends StatefulWidget {
  const TableWidgetExample({super.key});

  @override
  State<TableWidgetExample> createState() => _TableWidgetExampleState();
}

class _TableWidgetExampleState extends State<TableWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Widget Example"),
      ),
      body: Column(
        children: [
         Padding(
             padding: EdgeInsets.all(8.0),
         child: Table(
           textDirection: TextDirection.ltr,
           border: TableBorder.all(width: 1.0, color: Colors.black),
           children: [
             TableRow(
               children: [
                 Text("Education", textScaleFactor: 1.5),
                 Text("Institution name"),
                 Text("University"),
               ]
             ),
             TableRow(
                 children: [
                   Text("B.Tech"),
                   Text("ABESEC"),
                   Text("AKTU"),
                 ]
             ),
             TableRow(
                 children: [
                   Text("High School"),
                   Text("SFS"),
                   Text("ICSE"),
                 ]
             ),


           ],
         ),
         )
        ],
      ),

      // body:  SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Center(
      //         child: Text("Table"),
      //       ),
      //       DataTable(
      //           columns: [
      //             DataColumn(
      //               label: Text('ID'),
      //             ),
      //             DataColumn(
      //               label: Text('Name'),
      //             ),
      //             DataColumn(
      //               label: Text('Profession'),
      //             ),
      //           ],
      //           rows:[
      //
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('1')),
      //                   DataCell(Text('Stephen')),
      //                   DataCell(Text('Actor')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('2')),
      //                   DataCell(Text('John')),
      //                   DataCell(Text('Student')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('3')),
      //                   DataCell(Text('Harry')),
      //                   DataCell(Text('Leader')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //             DataRow(
      //                 cells: [
      //                   DataCell(Text('4')),
      //                   DataCell(Text('Peter')),
      //                   DataCell(Text('Scientist')),
      //                 ]),
      //
      //
      //           ]
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
