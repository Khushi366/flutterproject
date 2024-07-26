import 'dart:convert';
import 'dart:developer';

import 'package:categoryapi/Model/Comments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Model/Posts.dart';
class PostsDetails extends StatefulWidget {

  var pid = "";
  PostsDetails({required this.pid,});

  @override
  State<PostsDetails> createState() => _PostsDetailsState();
}

class _PostsDetailsState extends State<PostsDetails> {

  Posts? obj;
  var isloading = true;

  getdata()async
  {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts/"+widget.pid.toString());
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body = response.body.toString();
      log(body);

      var json = jsonDecode(body);
      setState(() {
        obj = Posts.fromJson(json);
        isloading = false;

      });
    }
  }


  List<Comments>?alldata;

  commentdata()async
  {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=1");
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body = response.body.toString();
      log(body);

      var json = jsonDecode(body);
      setState(() {
        alldata  =  json.map<Comments>((obj)=> Comments.fromJson(obj)).toList();
        isloading = false;

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    commentdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: isloading?Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (obj != null)
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(obj!.title.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Text(obj!.body.toString(),style: TextStyle(fontWeight: FontWeight.w200))
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 10.0,),
              Row(
                children: [
                  Card(
                      child: Container(
                          padding: EdgeInsets.all(4.0),
                          margin: EdgeInsets.all(4.0),
                          child: Text("Comments",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.0),))),
                ],
              ),



              alldata == null
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                  children: alldata!.map((obj){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(obj.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
                        Text(obj.email.toString(),style: TextStyle(color: Colors.grey,fontSize: 12.0,fontWeight: FontWeight.bold),),
                        Text(obj.body.toString(),style: TextStyle(color: Colors.grey,fontSize: 13.0),),
                        Divider(),
                      ],
                    );
                  }).toList()
              )



              // Expanded(
              //     child: alldata == null
              //         ? Center(child: CircularProgressIndicator())
              //         :ListView.builder(
              //         itemCount: alldata!.length,
              //         itemBuilder: (context, index){
              //           return Column(
              //             children: [
              //               ListTile(
              //                 title: Text(alldata![index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0),),
              //                 subtitle: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(alldata![index].email.toString(),style: TextStyle(color: Colors.grey,fontSize: 12.0,fontWeight: FontWeight.bold),),
              //                     SizedBox(height: 10.0,),
              //                     Text(alldata![index].body.toString(),style: TextStyle(color: Colors.grey,fontSize: 13.0),),
              //                   ],
              //                 ),
              //               ),
              //               Divider(),
              //             ],
              //           );
              //         }))
            ],
          ),
        ),
      ),


    );
  }
}
