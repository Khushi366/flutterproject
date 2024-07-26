import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
//import 'package:http/http.dart' as http;
class FakeProducttwo extends StatefulWidget {
  const FakeProducttwo({super.key});

  @override
  State<FakeProducttwo> createState() => _FakeProducttwoState();
}

class _FakeProducttwoState extends State<FakeProducttwo> {


  Future<List>?alldata;

  Future<List>? getdata()async
  {

    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    var response = await http.get(url);

    if(response.statusCode == 200)
      {
         var body  =  response.body.toString();
         print("Data : " + body);
         var json = jsonDecode(body);

         return json;
      }
    else
    {
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    alldata = getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshot)
          {
           if(snapshot.hasData)
             {

               if(snapshot.data!.length <=0)
                 {
                   return Center(child: Text("No data found!"),);
                 }
               else
               {
                 return ListView.builder(
                   itemCount: snapshot.data!.length,
                   itemBuilder: (context,index)
                     {

                       return Container(
                         child: Column(
                           children: [
                              Image.network(snapshot.data![index]["images"][0]),
                            
                             Text(snapshot.data![index]["title"].toString()),





                           ],
                         ),
                       );
                     }
                 );
               }
             }
            else
              {
                return Center(child: CircularProgressIndicator(),);
              }
          }
      )
    );
  }
}
