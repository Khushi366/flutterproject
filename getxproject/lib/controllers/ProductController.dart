
import 'dart:convert';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/models/Product.dart';
import 'package:getxproject/services/ApiServices.dart';
import 'package:getxproject/views/product/ViewProduct.dart';

import '../helper/ApiHandler.dart';
import '../resources/UrlResources.dart';

class ProductController extends GetxController
{
  var isLoading = true.obs;
  var productdata = <Product>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  //view product
  fetchProducts() async
  {
    try
      {
        isLoading(true);
       var allproducts = await ApiServices.getAllProducts();
       log(allproducts.toString());
        productdata.assignAll(allproducts);
      }
      finally
      {
        isLoading(false);
      }
  }

  //add product
  addProduct() async
  {
    try
    {
      isLoading(true);
      var params = {
        "pname":name.text.toString(),
        "qty":qty.text.toString(),
        "price":price.text.toString(),
      };
      var result = await ApiServices.insertProduct(params);
      if(result==true)
        {
          name.text="";
          qty.text="";
          price.text="";
          await fetchProducts();
          Get.off(ViewProduct());
        }
    }
    finally
    {
      isLoading(false);
    }
  }


  //deleteProduct
  deleteProduct(String pid)async
  {
    try
    {
      var params ={
        "pid":pid,
      };
      var result = await ApiServices.deleteProduct(params);
      if (result == true) {
        await fetchProducts();
      }
    }
    finally{
      isLoading(false);

    }
  }


  //Edit Show Product
  var updateid = "";
  getsingleproduct(pid) async
 {
   try
   {
     var params ={
       "pid":pid,
     };
     var data = await ApiServices.showEditProduct(params);
     var json = jsonDecode(data.toString());
     Product obj = Product.fromJson(json["data"]);
     name.text = obj.pname.toString();
     qty.text = obj.qty.toString();
     price.text = obj.price.toString();
     updateid = obj.pid.toString();
   }
   finally{
     isLoading(false);
   }
 }



 //Edit Product
 updateProduct() async
 {
   var params = {
     "pname":name.text.toString(),
     "qty":qty.text.toString(),
     "price":price.text.toString(),
     "pid":updateid
   };
   var result = await ApiServices.saveProduct(params);
   if (result == true) {

     await fetchProducts();
   }
 }
}