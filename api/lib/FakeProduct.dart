import 'dart:convert';
import 'dart:developer';

import 'package:api/ViewFakeProduct.dart';
import 'package:api/models/FProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeProduct extends StatefulWidget {
  const FakeProduct({super.key});

  @override
  State<FakeProduct> createState() => _FakeProductState();
}

class _FakeProductState extends State<FakeProduct> {


  //200-299 OK
  //400-499 Not found
  //500-599 Server


  List<FProduct>? alldata;

  // int calculate()
  // {
  //   return 10;
  // }
  //
  // var x = calculate();

  getdata() async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);

      setState(() {
        alldata = json.map<FProduct>((obj) => FProduct.fromJson(obj)).toList();
      });
      //1. Json loop
      //2 . one by one object
      //3. Convert class object
      //4. Objects List Store
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
      body: (alldata == null)
          ? Center(child: CircularProgressIndicator(),)
          : (alldata!.length <= 0) ? Center(child: Text("No data"),) :

      // return ListTile(
      //   title: Text(alldata![index].title.toString()),
      //   subtitle: Text(alldata![index].rating!.rate.toString()),
      //   onTap: ()
      //   {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewFakeProduct(
      //       obj: alldata![index],
      //     )));
      //   },
      // );


      Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(

              children: [
                SizedBox(height: 65.0,),

                Icon(Icons.arrow_back_ios_new_outlined),
                Expanded(
                  child: Center(
                    child: Text("Products",  style: TextStyle(
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
                  crossAxisCount: 2,),
                itemCount: alldata!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ViewFakeProduct(obj: alldata![index],)));
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
                          Expanded(child: Image.network(
                            alldata![index].image.toString(),
                            width: 100.0,),),
                          SizedBox(height: 22.0,),
                          Row(
                            children: [
                              Text(alldata![index].category.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),

                          //    Text(snapshot.data![index]["title"].toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs." + alldata![index].price.toString(),
                                style: TextStyle(
                                  color: Color(0xFFC0C0C0),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(height: 22.0,),
                              Text("Rate: " + alldata![index].rating!.rate
                                  .toString(),
                                style: TextStyle(
                                  color: Color(0xFFC0C0C0),
                                  fontSize: 14.0,
                                ),
                              ),

                            ],
                          ),
                          // Text(snapshot.data![index]["category"].toString()),
                          // Text(snapshot.data![index]["images"][0].toString()),
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),

    );
  }
}

// body: Column(
//   children: [
//     SizedBox(height: 30.0,),
//     Text('Products',
//       style: TextStyle(
//         fontSize: 18.0,
//         fontWeight: FontWeight.bold,
//       ),),
//     Expanded(
//       child: FutureBuilder(
//         future: alldata,
//         builder: (context,snapshot)
//         {
//           if(snapshot.hasData)
//             {
//               if(snapshot.data!.length<=0)
//                 {
//                   return Center(
//                     child: Text("No data"),
//                   );
//                 }
//               else
//                 {
//                   return GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context,index)
//                     {
//                       return GestureDetector(
//                         onTap: (){
//                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewFakeProduct(
//                             img: snapshot.data![index]["image"].toString(),
//                             category:snapshot.data![index]["category"].toString(),
//                             rs:snapshot.data![index]["price"].toString(),
//                             rate:snapshot.data![index]["rating"]["rate"].toString(),
//                             description:snapshot.data![index]["description"].toString(), )));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(8.0),
//                           padding: EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(child: Image.network(snapshot.data![index]["image"].toString(),width: 100.0,),),
//                               SizedBox(height: 22.0,),
//                               Row(
//                                 children: [
//                                   Text(snapshot.data![index]["category"].toString(),
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                           //    Text(snapshot.data![index]["title"].toString()),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Rs." + snapshot.data![index]["price"].toString(),
//                                     style: TextStyle(
//                                       color: Color(0xFFC0C0C0),
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//                                   SizedBox(height: 22.0,),
//                                   Text("Rate: "+snapshot.data![index]["rating"]["rate"].toString(),
//                                     style: TextStyle(
//                                       color: Color(0xFFC0C0C0),
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                               // Text(snapshot.data![index]["category"].toString()),
//                               // Text(snapshot.data![index]["images"][0].toString()),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//             }
//           else
//             {
//               return Center(child: CircularProgressIndicator(),);
//             }
//         },
//       ),
//     ),
//   ],
// ),

