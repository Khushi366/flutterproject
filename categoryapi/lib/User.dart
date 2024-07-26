import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Model/Users.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  TextEditingController search = TextEditingController();

  List<Users> users = [];
  List<Users> filteredUsers = [];
  var isLoading = true;

  getdata()async
  {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response =  await http.get(url);
    if(response.statusCode == 200)
      {
        var body = response.body.toString();
        log(body);
        var json  = jsonDecode(body);
        setState(() {
          users = List<Users>.from(json.map((obj) => Users.fromJson(obj)));
          filteredUsers = users;
          isLoading = false;

        });

      }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    search.addListener(filterUsers);
  }


 void filterUsers() {
    var query = search.text.toLowerCase();
    setState(() {
      filteredUsers = users.where((user) {
        return user.email!.toLowerCase().contains(query) || user.name!.toLowerCase().contains(query);
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
        title: Text("User"),
        centerTitle: true,
      ),
      body: isLoading?Center(child: CircularProgressIndicator(),):
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: search,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Email",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        title: Text(filteredUsers[index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text("email: "+filteredUsers[index].email.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text("street: "+filteredUsers[index].address!.street.toString()),
                              ],
                            ),

                            Row(
                              children: [
                                Text("City: "+filteredUsers[index].address!.city.toString()),

                              ],
                            ),
                            Row(
                              children: [
                                Text("Goe: "+filteredUsers[index].address!.geo!.lat.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phone: "+filteredUsers[index].phone.toString()),

                              ],
                            ),
                            Row(
                              children: [
                                Text("CoMName: "+filteredUsers[index].company!.name.toString()),

                              ],
                            )
                          ],
                        ),

                      ),
                      Divider(),
                    ],
                  );

                }
            ),
          ),
        ],
      ),
    );
  }
}
