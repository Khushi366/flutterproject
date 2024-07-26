import 'dart:convert';
import 'dart:developer';

import 'package:dummyproduct/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ViewProductDetails extends StatefulWidget {
  var prid = "";

  ViewProductDetails({required this.prid});

  @override
  State<ViewProductDetails> createState() => _ViewProductDetailsState();
}

class _ViewProductDetailsState extends State<ViewProductDetails> {
  Product?obj;
  var isloading = true;

  getdata()async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products/"+widget.prid.toString());
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body = response.body.toString();
      log(body);

      var json = jsonDecode(body);
      setState(() {
        obj = Product.fromJson(json);

        isloading = false;

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
      backgroundColor: Colors.white,
      body:  isloading?Center(child: CircularProgressIndicator(),)
          :Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [

            SizedBox(height: 33.0,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined),
                ],
              ),
            ),

            SizedBox(height: 33.0,),

            FadeInImage.assetNetwork(
              placeholder: '',
              image: obj!.image.toString(),
              width: 100,
              placeholderErrorBuilder: (context, error, stackTrace) {
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 33.0,),

            Row(
              children: [
                Text(obj!.category.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),),
              ],
            ),

            Row(
              children: [
                Text("₹."+obj!.price.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),),
              ],
            ),

            Row(
              children: [
                Text("Rates."+obj!.rating!.rate.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Rates."+obj!.title.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(obj!.description.toString(),
                  style: TextStyle(
                    color: Color(0xFFC0C0C0),
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
