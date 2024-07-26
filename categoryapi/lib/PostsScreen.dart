import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Model/Posts.dart';
import 'PostsDetails.dart';
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  List<Posts> posts = [];
  var isLoading = true;

  getdata()async
  {
    Uri url =Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        var body = response.body.toString();
        log(body);
        var json = jsonDecode(body);
        setState(() {
          posts = List<Posts>.from(json.map((obj) => Posts.fromJson(obj)));

          isLoading = false;
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
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
      ),
      body: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context,index){
            return  Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostsDetails(
                      pid: posts[index].id.toString(),

                    )));
                  },
                  child: ListTile(
                    title: Text(posts[index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(posts[index].body.toString()),
                  ),
                ),
                Divider(),
              ],
            );
          }),
    );
  }
}
