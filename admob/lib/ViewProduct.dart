import 'dart:convert';
import 'dart:developer';

import 'package:admob/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart'as http;
class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  BannerAd? _middlebannerad;
  List<Product>?allData;
  bool _istop = false;

  getData()async{

    Uri url = Uri.parse("https://dummyjson.com/products");
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        var body =  response.body.toString();
        log(body);
        var json = jsonDecode(body);
        setState(() {
          allData = json["products"].map<Product>((obj)=>Product.fromJson(obj)).toList();
        });
      }

  }
  loadmiddlebanner() {
    _middlebannerad = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _istop = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _middlebannerad!.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmiddlebanner();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (allData == null)?Center(child: CircularProgressIndicator(),)
          :(allData!.length<=0)?Center(child: Text("Data not found!"),)
      :ListView.builder(
          itemCount: allData!.length,
          itemBuilder: (context,index){
            if (index == 3) {
              return Container(
                  height: _middlebannerad!.size.height.toDouble(),
                  width: _middlebannerad!.size.width.toDouble(),
                  // color: Colors.yellow,
                  child: AdWidget(
                    ad: _middlebannerad!,
                  ));
            } else {
              return  Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(""+allData![index].title.toString()),
                    Text(""+allData![index].category.toString()),
                  ],
                ),
              );
            }

      }),
    );
  }
}
