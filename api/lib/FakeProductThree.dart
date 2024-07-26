import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class FakeProductThree extends StatefulWidget {
  const FakeProductThree({super.key});

  @override
  State<FakeProductThree> createState() => _FakeProductThreeState();
}

class _FakeProductThreeState extends State<FakeProductThree> {

  Future<List>?alldata;
 Future<List>?getdata()async
  {
    
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    var response = await http.get(url);

    if(response.statusCode == 200)
      {
         var body = response.body.toString();
         var json = jsonDecode(body);
         return json;
         //log(body);
          print("Data :" + body.toString());
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
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index)
                    {
                      return Column(
                        children: [
                          Image.network(snapshot.data![index]["avatar"].toString()),
                          Text(snapshot.data![index]["name"].toString()),
                          Text(snapshot.data![index]["role"].toString()),
                        ],
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
      ),
      
    );
  }
}
