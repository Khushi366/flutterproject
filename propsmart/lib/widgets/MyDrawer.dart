import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/views/auth/Login.dart';
import 'package:propsmart/views/employee/AddEmployee.dart';
import 'package:propsmart/views/employee/ViewEmployee.dart';
import 'package:propsmart/views/product/AddProduct.dart';
import 'package:propsmart/views/product/ViewProduct.dart';
import 'package:propsmart/views/profile/MyProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var firstName = "";
  var email="";
  var image="";

  // getData()async {
  //   // log("In drawer");
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //
  //   //   setState(() {
  //   //     firstName = prefs.getString("firstName").toString();
  //   //   });
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // var token = prefs.getString("token");
  //   // log("Login token: $token");
  //   //log("Login token: " + (token ?? ""));
  //   //  var staticToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTc3NjAwOTYsImV4cCI6MTcxNzc2MzY5Nn0.5sy5lq3_nrXu6GpnLm_-KV_awfQjABFOlFN9sZj0PYE";
  //
  //   // if (token != null) {
  //   //   log("Token to decode: $token");
  //   //   var tokenValid = await checkTokenValidity(token);
  //   //   if (tokenValid) {
  //   //     Uri url = Uri.parse("https://dummyjson.com/auth/me");
  //   //     var header = {
  //   //       'Authorization': 'Bearer ' + prefs.getString("token").toString(),
  //   //     };
  //   //     var response = await http.get(url, headers: header);
  //   //     log(response.statusCode.toString());
  //   //     if (response.statusCode == 200) {
  //   //       var body = response.body.toString();
  //   //       log(body);
  //   //     }
  //   //   }else {
  //   //      log("Token is expired or invalid.");
  //   //     try {
  //   //       await Future.delayed(Duration(seconds: 5));
  //   //       String newToken = "refreshToken";
  //   //       prefs.setString("token", newToken);
  //   //       log("Token refreshed successfully: "+ newToken);
  //   //       await getData();
  //   //     } catch (e) {
  //   //       log("Token refresh failed: $e");
  //   //     }
  //   //   }
  //   // } else {
  //   //   log("Token not available.");
  //   // }
  //
  //   //   await ApiHandler.getLogin(UrlResources.LOGIN_AUTH,
  //   //    headers: {
  //   //      'Authorization': 'Bearer ' + prefs.getString("token").toString(),}).then((json) async {
  //   //
  //   //     if (json is ErrorHandler && json.code == 401) {
  //   //       log("Token Expired!");
  //   //       Navigator.of(context).push(
  //   //         MaterialPageRoute(builder: (context) => Login()),
  //   //       );
  //   //       return;
  //   //     }
  //   //
  //   //
  //   //     log(json.toString());
  //   //        setState(() {
  //   //          lastname = json["lastName"].toString();
  //   //          email = json["email"].toString();
  //   //        });
  //   // });
  //
  // }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var refreshToken = prefs.getString("refreshToken");
    log("Login token: $token");
    if (token != null) {
      log("Token to decode: $token");

      try {
        var json = await ApiHandler.getProfile(UrlResources.LOGIN_AUTH,
          headers: {
            'Authorization': 'Bearer ' + prefs.getString("token").toString(),
          },
        );

        setState(() {
          firstName = json["firstName"].toString();
          email = json["email"].toString();
          image = json["image"].toString();
        });
      } on ErrorHandler catch (error) {
        if (error.code == 401) {
          // Handle 401 Unauthorized (token expired or invalid)
          log("Token is expired or invalid.");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Token is expired or invalid."),
              duration: Duration(seconds: 2),
            ),
          );

          // Attempt token refresh if refreshToken is available
          try {
            if (refreshToken != null) {
              var response = await ApiHandler.postRefreshToken(
                UrlResources.REFRESH_TOKEN,
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode({'refreshToken': refreshToken}),
              );

              if (response.statusCode == 200) {
                var newToken = jsonDecode(response.body)["token"];
                var newRefreshToken = jsonDecode(
                    response.body)["refreshToken"];
                prefs.setString("token", newToken);
                prefs.setString("refreshToken", newRefreshToken);
                log("Token refreshed successfully: $newToken");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Token refreshed successfully"),
                    duration: Duration(seconds: 2),
                  ),
                );

                // Retry fetching data after token refresh
                await getData();
              } else {
                log("Token refresh failed with status: " +
                    response.statusCode);
              }
            } else {
              log("Refresh token not available.");
            }
          } on ErrorHandler catch (ex) {
            log("ErrorHandler caught during refresh:" + ex.message);
            if (ex.message == "Internet Connection Failure") {
              // Redirect to no internet page
            } else {
              // Redirect to support page
            }
          } catch (e) {
            log("Token refresh failed: " + e.toString());
          }
        } else {
          // Handle other errors
          log("Error fetching profile: " + error.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error:" + error.message),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } else {
      log("Token not available.");
      // Handle scenario where token is not available
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
    return Drawer(
      child: ListView(
        // padding: const EdgeInsets.all(8.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""+firstName.toString()),
            accountEmail: Text(""+email.toString()),

            currentAccountPicture: image.isNotEmpty
                ? FadeInImage.assetNetwork(
                placeholder: '',
                image: image,
                width: 100,
                placeholderErrorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                      width: 5.0,
                      height: 6.0,
                      child: CircularProgressIndicator(color: Colors.white,));
                },
              ) : CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF233645),
            ),
          ),

          SizedBox(height: 50.0,),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add Product"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProduct()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text("View Product"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewProduct()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add Employee"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddEmployee()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text("View Employee"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewEmployee()));

            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile()));

            },
          ),
        ],
      ),
    );
  }
}
