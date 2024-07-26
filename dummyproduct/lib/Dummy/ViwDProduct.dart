import 'dart:convert';
import 'dart:developer';

import 'package:dummyproduct/model/DProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'ViewDProductDetails.dart';

class ViwDProduct extends StatefulWidget {
  const ViwDProduct({super.key});

  @override
  State<ViwDProduct> createState() => _ViwDProductState();
}

class _ViwDProductState extends State<ViwDProduct> {

  List<DProduct>?alldata;
  getdata()async
  {
    Uri url = Uri.parse("https://dummyjson.com/products");
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        var body  = response.body.toString();
        log(body);
        var json = jsonDecode(body);

        setState(() {
          alldata = json["products"].map<DProduct>((obj)=>DProduct.fromJson(obj)).toList();

        });
      }
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
      body: (alldata == null)?Center(child: CircularProgressIndicator(),)
          :(alldata!.length <=0)
          ?Center(child: Text("Data not found!"),)
          :Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                SizedBox(height: 65.0,),
                Expanded(
                  child: Center(
                    child: Text("Dummy Products",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                ),
                itemCount: alldata!.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ViewDProductDetails(pid: alldata![index].id.toString(),)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                            alldata![index].images![0].toString(),
                            width: 100.0,),),
                          SizedBox(height: 22.0,),
                          Row(
                            children: [
                              Expanded(
                                child: Text(alldata![index].title.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Rs."+alldata![index].price.toString(),),
                              SizedBox(width: 12.0,),
                              Text("rate"+alldata![index].reviews![0].rating.toString(),),
                            ],
                          ),

                        ],
                      ),


                    ),
                  );

                }),
          ),
        ],
      ),
    );

  }
}
