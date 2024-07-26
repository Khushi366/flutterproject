import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/providers/ProductProvider.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/widgets/MyTextBox.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _name =TextEditingController();
  TextEditingController _qty =TextEditingController();
  TextEditingController _price =TextEditingController();


  ProductProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Add Products",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          MyTextBox(
            hinttext: "Product Name",
            keywordType: TextInputType.name,
            controller: _name,
          ),


          SizedBox(height: 20.0,),
          MyTextBox(
            hinttext: "Qty",
            keywordType: TextInputType.number,
            controller: _qty,
          ),

          SizedBox(height: 20.0,),
          MyTextBox(
            hinttext: "Price",
            keywordType: TextInputType.number,
            controller: _price,
          ),
          SizedBox(height: 12.0,),

          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));


          PrimaryButton(
            btntext: "Add",
            btncolor: Color(0xFF294357),
            onclick: ()async{
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));

              var name = _name.text.toString();
              var qty = _qty.text.toString();
              var price = _price.text.toString();


              if(name.isEmpty || qty.isEmpty || price.isEmpty)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("All fields are required."),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              var params = {
                "pname":name,
                "qty":qty,
                "price":price
              };

              await provider!.insertProduct(context,params);

              if(provider!.isinsert==true)
                {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(provider!.insertmessage),backgroundColor: Colors.black,)
                      );
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(provider!.insertmessage),backgroundColor: Colors.black,)
                  );
                }

              // Uri url =Uri.parse(UrlResources.ADD_PRODUCT);
              // var response = await http.post(url,body: params);
              // if(response.statusCode == 200)
              // {
              //   var json = jsonDecode(response.body.toString());
              //   if(json["status"]== "true")
              //   {
              //     var message = json["message"];
              //     ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text(message),backgroundColor: Colors.black,)
              //     );
              //
              //     _name.text ="";
              //     _qty.text ="";
              //     _price.text ="";
              //
              //   }
              //   else
              //   {
              //     var message = json["message"];
              //     ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text(message),backgroundColor: Colors.red,)
              //     );
              //   }
              //
              // }
            },
          ),
        ],
      ),
    ),
    );
  }
}
