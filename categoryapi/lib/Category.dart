import 'dart:convert';
import 'dart:developer';

import 'package:categoryapi/CategoryDetails.dart';
import 'package:categoryapi/Model/Category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // List<String> categories = [];
  // bool isloading = true;
  //
  // getdata()async
  // {
  //   Uri url = Uri.parse("https://dummyjson.com/products/categories");
  //
  //   var response = await http.get(url);
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       var body = response.body;
  //       log(body);
  //       var json = jsonDecode(body);
  //       log(json.runtimeType.toString());
  //       setState(() {
  //         categories = List<String>.from(json);
  //         isloading = false;
  //       });
  //     }
  //   }catch(e)
  //   {
  //     log("ERROR IS THAT :"+e.toString());
  //   }
  // }


  TextEditingController search = TextEditingController();
  List<Categorys>alldata = [];
  List<Categorys>filteredData = [];
  bool isloading = true;
  getData() async
  {
    Uri url = Uri.parse("https://dummyjson.com/products/categories");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      log(body);
      var json = jsonDecode(body);
      setState(() {
        alldata = List<Categorys>.from(json.map((obj) => Categorys.fromJson(obj)));
        filteredData = List<Categorys>.from(alldata);
        isloading = false;
      });
    }else {
      // Handle error or retry logic here
      setState(() {
        isloading = false;
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    search.addListener(filterUsers);

  }
  void filterUsers() {
    var query = search.text.toLowerCase();
    setState(() {
      filteredData = alldata.where((category) {
        return  category.name!.toLowerCase().contains(query);
      }).toList();
    });
  }
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category"),
          centerTitle: true,

        ),


        body:isloading?Center(child: CircularProgressIndicator(),)
            : ListView.builder(
            itemCount: alldata!.length,
            itemBuilder: (context,index){
              return  GestureDetector(
                onTap: (){

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {

                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return AlertDialog(
                              title: Text("Item Details"),
                              content: SizedBox(
                                height: 300, // Adjust height as needed
                                child: Column(
                                  children: [
                                    TextField(
                                      controller:search,
                                      decoration: InputDecoration(
                                        hintText: 'Search...',
                                        contentPadding: EdgeInsets.all(12),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          filterUsers();
                                          //  getData();
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child:filteredData.isNotEmpty
                                          ?ListView.builder(
                                        itemCount: filteredData.length,
                                        // Assuming item has a details list
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                                filteredData[index].name.toString()),
                                            subtitle: Text(
                                                filteredData[index].slug.toString()),
                                            // Add onTap handler for details if needed
                                          );
                                        },
                                      ): Center(
                                        child: Text('No data found'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    search.clear();
                                    Navigator.of(context)
                                        .pop(); // Close the AlertDialog
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          });
                    },
                  );
                },
                child: ListTile(
                  trailing: Icon(Icons.arrow_drop_down),
                  title: Text(alldata![index].name.toString()),
                  subtitle:Text(alldata![index].slug.toString()) ,
                ),
              );
            }
        )
    );
  }
}
