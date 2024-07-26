import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:recipes/Model/Recipes.dart';
import 'package:recipes/RecipeDetails.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Recipes>?allData;

    getData() async {
      Uri url = Uri.parse("https://dummyjson.com/recipes");
      var response = await http.get(url);
      if(response.statusCode ==200)
        {
          var body =  response.body.toString();
          log(body);

          var json = jsonDecode(body);
          setState(() {
            allData = json["recipes"].map<Recipes>((obj)=>Recipes.fromJson(obj)).toList();
          });
        }
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2D36),
      body:(allData == null)?Center(child: CircularProgressIndicator(),):(allData!.length<=0)?Center(child: Text("Data not found!"),)
          : GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75, // Adjust the aspect ratio to increase container size
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 1.0,

          ),
          itemCount: allData!.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (contex)=>RecipesDetails(
                  id: allData![index].id.toString(),
                )));
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xFF353842),
                  border: Border.all(color: Color(0xFF353842)),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(allData![index].image.toString()),
                    ),
                   SizedBox(height: 22.0,),
                    Expanded(
                      child: Text(allData![index].name.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,

                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,),

                    Row(
                      children: [
                        Icon(Icons.star_border_outlined,size:20.0,color: Color(0xFF686F82),),
                        SizedBox(width: 2.0),
                        Text(allData![index].rating.toString(),
                          style: TextStyle(
                            color: Color(0xFF686F82),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,

                          ),
                        ),
                        Text(
                          '(' + allData![index].reviewCount.toString() + ')',
                          style: TextStyle(
                            color: Color(0xFF686F82),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,

                          ),
                        ),
                        SizedBox(width: 15.0,),
                        Icon(Icons.watch_later_outlined,size: 20.0,color: Color(0xFF686F82),),
                        SizedBox(width: 2.0,),

                        Text(
                          allData![index].prepTimeMinutes.toString(),
                          style: TextStyle(
                            color: Color(0xFF686F82),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,

                          ),
                        ),
                        SizedBox(width: 2.0,),

                        Flexible(
                          child: Text(
                            "min",
                            style: TextStyle(
                              color: Color(0xFF686F82),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,

                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 15.0,),

                    Text(
                     '₹'+ allData![index].caloriesPerServing.toString(),
                      style: TextStyle(
                        color: Color(0xFFFF7269),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,

                      ),
                    ),

                  ],
                ),
              ),
            );
          }

      ),

    );
  }
}
