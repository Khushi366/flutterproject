import 'dart:convert';
import 'dart:developer';

import 'package:dummyproduct/model/DProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ViewDProductDetails extends StatefulWidget {
  var pid = "";

  ViewDProductDetails({required this.pid});

  @override
  State<ViewDProductDetails> createState() => _ViewDProductDetailsState();
}

class _ViewDProductDetailsState extends State<ViewDProductDetails> {
  DProduct?obj;
  var isloading = true;

  getdata()async
  {
    Uri url = Uri.parse("https://dummyjson.com/products/"+widget.pid.toString());
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body = response.body.toString();
      log(body);

      var json = jsonDecode(body);
      setState(() {
        obj = DProduct.fromJson(json);
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
      body: isloading?Center(child: CircularProgressIndicator(),)
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
            if (obj != null)
            FadeInImage.assetNetwork(
              placeholder: '',
              image: obj!.thumbnail.toString(),
              width: 100,
              placeholderErrorBuilder: (context, error, stackTrace) {
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 33.0,),

            Row(
              children: [
                Text("₹."+obj!.price.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(width: 10.0,),
                Text("rating"+obj!.rating.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Text("Stock "+obj!.stock.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Text(""+obj!.title.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(""+obj!.tags.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),

                  ],
                ),
              ],
            ),

            SizedBox(height: 20.0,),
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
            SizedBox(height: 20.0,),

            Row(
              children: [
                Expanded(child: Text("Warranty "+obj!.warrantyInformation.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Shipping "+obj!.shippingInformation.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Awailable "+obj!.availabilityStatus.toString(),
                  style: TextStyle(
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
