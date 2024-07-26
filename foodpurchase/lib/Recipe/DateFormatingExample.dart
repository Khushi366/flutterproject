import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodpurchase/model/Authors.dart';
import 'package:intl/intl.dart';

class DateFormatingExample extends StatefulWidget {
  const DateFormatingExample({super.key});

  @override
  State<DateFormatingExample> createState() => _DateFormatingExampleState();
}

class _DateFormatingExampleState extends State<DateFormatingExample> {

  var booksData = [
    {
      "id": 1,
      "name": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "date": "1925-04-10"
    },
    {
      "id": 2,
      "name": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "date": "1960-07-11"
    },
    {
      "id": 3,
      "name": "rob",
      "author": "George Orwell",
      "date": "1949-06-08"
    },
    {
      "id": 4,
      "name": "georgia",
      "author": "Georgia olsen",
      "date": "1729-10-08"
    },
    {
      "id": 5,
      "name": "mcfury",
      "author": "furyy",
      "date": "1990-02-02"
    },
    {
      "id": 6,
      "name": "mark",
      "author": "mark",
      "date": "1629-10-10"
    },
    {
      "id": 7,
      "name": "harry",
      "author": "harry peter",
      "date": "1909-10-08"
    },
    {
      "id": 8,
      "name": "ohm",
      "author": "omen",
      "date": "1709-10-28"
    },
    {
      "id": 9,
      "name": "lily",
      "author": "lyilyyami",
      "date": "1929-10-08"
    },
    {
      "id": 10,
      "name": "ilsa",
      "author": "ilisa",
      "date": "1729-10-08"
    },
  ];
  List<Authors>? alldata;
  getdata(){
    var json = jsonDecode(jsonEncode(booksData.toString()));
    // log(json.toString());
    setState(() {
      alldata = booksData.map((obj)=>Authors.fromJson(obj)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateFormatingExample"),
      ),
      body: (alldata!=null)?ListView.builder(
        itemCount: alldata!.length,
        itemBuilder: (context,index){


          DateFormat originalFormat = DateFormat('yyyy-MM-dd');
          DateFormat targetFormat = DateFormat('dd-MM-yyyy');
          DateTime dateTime = originalFormat.parse(alldata![index].date.toString());
          var d = targetFormat.format(dateTime);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey
              ),
              child: ListTile(
                title: Text("Name "+alldata![index].name.toString()),
                subtitle: Text("Publish Date: "+d.toString()),
                trailing: IconButton(onPressed: (){},
                icon: Icon(Icons.favorite_border),),
              ),
            ),
          );
        },
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
