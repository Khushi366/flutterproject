import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:recipes/Model/Recipes.dart';

class RecipesDetails extends StatefulWidget {
  var id;
  RecipesDetails({required this.id});

  @override
  State<RecipesDetails> createState() => _RecipesDetailsState();
}

class _RecipesDetailsState extends State<RecipesDetails> {

  Recipes?obj;
  var isloading = true;

  getData()async
  {
    Uri url = Uri.parse("https://dummyjson.com/recipes/"+widget.id.toString());

     var response = await http.get(url);
     if (response.statusCode == 200) {
       var body = response.body.toString();
       log(body);
       var json = jsonDecode(body);

       setState(() {
         obj = Recipes.fromJson(json);
         isloading = false;
       });
     }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("ID NO: "+widget.id.toString());
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              if (obj != null)
                Stack(
                  children: [
                    // Image or FadeInImage
                    Center(
                      child: FadeInImage.assetNetwork(
                        placeholder: '',
                        image: obj!.image.toString(),
                        width: double.infinity,
                        fit: BoxFit.cover, // Cover the width of the screen
                        placeholderErrorBuilder:
                            (context, error, stackTrace) {
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                    // Positioned container resembling bottom sheet
                    Positioned(
                      top: 310, // Adjust this value to position the container
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.white, // Adjust opacity as needed
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Bottom Sheet Content',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Add more content here if needed
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Adjust opacity as needed

                  border: Border(
                    left: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Bottom Sheet Content',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Add more content here if needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}
