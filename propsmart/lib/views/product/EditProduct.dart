import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/widgets/MyTextBox.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';
import 'ViewProduct.dart';

class EditProduct extends StatefulWidget {
  var id = "";
  EditProduct({required this.id});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  TextEditingController _name =TextEditingController();
  TextEditingController _qty =TextEditingController();
  TextEditingController _price =TextEditingController();

  // getdata()async
  // {
  //   Uri url = Uri.parse("https://studiogo.tech/student/studentapi/getSingleProduct.php");
  //   var params = {
  //     "pid":widget.id.toString()
  //   };
  //   var response = await http.post(url,body: params);
  //   if(response.statusCode == 200)
  //   {
  //     var json = jsonDecode(response.body.toString());
  //     _name.text = json["data"]["pname"].toString();
  //     _qty.text = json["data"]["qty"].toString();
  //     _price.text = json["data"]["price"].toString();
  //   }
  // }

  ProductProvider? provider;

  getData()async
  {
    var params = {
      "pid":widget.id.toString()
    };

    await provider!.getsingleproduct(params);

      _name.text = provider!.singleobj!.pname.toString();
      _qty.text = provider!.singleobj!.qty.toString();
      _price.text = provider!.singleobj!.price.toString();


    // await ApiHandler.postRequest(UrlResources.UPDATE_SHOW_PRODUCT,body: params).then((json){
    //   _name.text = json["data"]["pname"].toString();
    //   _qty.text = json["data"]["qty"].toString();
    //   _price.text = json["data"]["price"].toString();
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getData();
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


          PrimaryButton(
              btntext: "Edit",
              btncolor: Color(0xFF294357),
              onclick: ()async {
                var name = _name.text.toString();
                var qty = _qty.text.toString();
                var price = _price.text.toString();
                if (name.isEmpty || qty.isEmpty || price.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("All fields are required."),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                var params = {
                  "pname": name,
                  "qty": qty,
                  "price": price,
                  "pid": widget.id.toString(),
                };

                await provider!.updateProduct(params);
                if(provider!.isupdate==true)
                  {
                    Navigator.of(context).pop();
                  }
                else
                  {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error"),
                                backgroundColor: Colors.black,)
                          );
                  }

                // try {
                //   await ApiHandler.postRequest(
                //       UrlResources.UPDATE_PRODUCT, body: params).then((json) {
                //     if (json["status"] == "true") {
                //       var message = json["message"];
                //       Navigator.of(context).pop();
                //       Navigator.of(context).pop();
                //       Navigator.of(context).push(
                //           MaterialPageRoute(builder: (context) => ViewProduct())
                //       );
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text(message),
                //             backgroundColor: Colors.black,)
                //       );
                //       _name.text = "";
                //       _qty.text = "";
                //       _price.text = "";
                //     }
                //     else {
                //       var message = json["message"];
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(content: Text(message),
                //             backgroundColor: Colors.red,)
                //       );
                //     };
                //   },
                //   );
                // }
                // on ErrorHandler catch (ex)
                // {
                //   // log(ex.message.toString());
                //   if(ex.message.toString()=="Internet Connection Failure")
                //   {
                //     //rdirect to no internet page
                //   }
                //   else
                //   {
                //     //redirect to support page
                //   }
                // }
                // GestureDetector(
                //   onTap: ()async{
                //
                //
                //     var name = _name.text.toString();
                //     var qty = _qty.text.toString();
                //     var price = _price.text.toString();

                //
                //     if(name.isEmpty || qty.isEmpty || price.isEmpty)
                //     {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text("All fields are required."),
                //           backgroundColor: Colors.red,
                //         ),
                //       );
                //       return;
                //     }
                //
                //     var params = {
                //       "pname":name,
                //       "qty":qty,
                //       "price":price,
                //       "pid": widget.id.toString(),
                //     };

                //
                //     Uri url = Uri.parse("https://studiogo.tech/student/studentapi/updateProductNormal.php");
                //     var response = await http.post(url,body: params);
                //     if(response.statusCode==200)
                //     {
                //       var json = jsonDecode(response.body.toString());
                //       if(json["status"]== "true")
                //       {
                //
                //         var message = json["message"];
                //         Navigator.of(context).pop();
                //         Navigator.of(context).pop();
                //         Navigator.of(context).push(
                //             MaterialPageRoute(builder: (context)=>ViewProduct())
                //         );
                //         ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(content: Text(message),backgroundColor: Colors.black,)
                //         );
                //         _name.text ="";
                //         _qty.text ="";
                //         _price.text ="";
                //
                //       }
                //       else
                //       {
                //         var message = json["message"];
                //         ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(content: Text(message),backgroundColor: Colors.red,)
                //         );
                //       }

                //     }
                //
                //
                //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                //
                //   },
                //   child: Container(
                //       width: double.infinity,
                //       height: 40,
                //       alignment: Alignment.center,
                //       // margin: EdgeInsets.symmetric(horizontal: 20.0),
                //       padding: EdgeInsets.all(10.0),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Color(0xFF233645),
                //       ),
                //       child:Text("Save",style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),)),
                // ),
              }
          )
        ],
       ),
      ),
    );
  }
}
