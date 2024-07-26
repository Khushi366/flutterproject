import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/views/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  var firstName = "";
  var lastname="";
  var email="";
  var gender="";
  var address="";
  var city="";
  var coordinates="";
  var image="";


//Without ApiHendler

//   getData()async {
//       // log("In drawer");
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       //
//       //   setState(() {
//       //     firstName = prefs.getString("firstName").toString();
//       //   });
//
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var token = prefs.getString("token");
//       var refreshToken = prefs.getString("refreshToken");
//       log("Login token: $token");
//       // log("Login token: $refreshToken");
//
//       //log("Login token: " + (token ?? ""));
//       //  var staticToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTc3NjAwOTYsImV4cCI6MTcxNzc2MzY5Nn0.5sy5lq3_nrXu6GpnLm_-KV_awfQjABFOlFN9sZj0PYE";
//
//       // var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTgyMDMwOTIsImV4cCI6MTcxODIwNjY5Mn0.YWC04pxIdTDJaS3buAGr2oEf8w0trNOZ59E4lGNgwWo";
//       // var refreshToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTgyMDc5NzUsImV4cCI6MTcyMDc5OTk3NX0.vHtJ6XPmLo_X_NSHcG_zG6lhrQ31Swt4HuGlC5DyVXc";
//
//       if (token != null) {
//         log("Token to decode: $token");
//         Uri url = Uri.parse("https://dummyjson.com/auth/me");
//         var header = {
//           'Authorization': 'Bearer ' + prefs.getString("token").toString(),
//           //  'Authorization': 'Bearer ' + token,
//
//         };
//         var response = await http.get(url, headers: header);
//         log(response.statusCode.toString());
//         if (response.statusCode == 200) {
//           var body = response.body.toString();
//           log(body);
//           var json = jsonDecode(body);
//           setState(() {
//             image = json["image"].toString();
//             firstName = json["firstName"].toString();
//             lastname = json["lastName"].toString();
//             email = json["email"].toString();
//             gender = json["gender"].toString();
//           });
//         }
//         else {
//           log("Token is expired or invalid.");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Token is expired or invalid."),
//               duration: Duration(seconds: 2),
//             ),
//           );
//           try {
//             if (refreshToken != null) {
//               Uri url = Uri.parse("https://dummyjson.com/auth/refresh");
//               var header = {
//                 'Content-Type': 'application/json',
//               };
//               var body = jsonEncode({
//                 'refreshToken': refreshToken,
//
//               });
//               var response = await http.post(url, headers: header, body: body);
//               if (response.statusCode == 200) {
//                 var newToken = jsonDecode(response.body)["token"];
//                 var newRefreshToken = jsonDecode(response.body)["refreshToken"];
//                 prefs.setString("token", newToken);
//                 prefs.setString("refreshToken", newRefreshToken);
//                 log("Token refreshed successfully: " + newToken);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("Token refreshed successfully"),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//                 await getData();
//               }
//               else {
//                 log("Token refresh failed with status: ${response.statusCode}");
//               }
//             } else {
//               log("Refresh token not available.");
//             }
//           } catch (e) {
//             log("Token refresh failed: $e");
//           }
//         }
//       } else {
//         log("Token not available.");
//       }
//     }


    // With ApiHendler
    getData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var refreshToken = prefs.getString("refreshToken");
      log("Login token: $token");
      //log("Login token: " + (token ?? ""));

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
            lastname = json["lastName"].toString();
            email = json["email"].toString();
            gender = json["gender"].toString();
            address = json["address"]["address"].toString();
            city = json["address"]["city"].toString();
            coordinates = json["address"]["coordinates"]["lat"].toString();
            image = json["image"].toString();
          });
          log(address);
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
                  var newRefreshToken = jsonDecode(response.body)["refreshToken"];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("MyProfile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Column(
                children: [
                  (image.isNotEmpty)
                    ?Center(
                    child: FadeInImage.assetNetwork(
                      placeholder: '',
                      image: image,
                      width: 100,
                      placeholderErrorBuilder: (context, error, stackTrace) {
                        return CircularProgressIndicator();
                      },
                    ),
                  ): CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                 // Center(child: Image.network(image,scale: 7,))
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person,color:  Color(0xFF233645),),
                  SizedBox(width: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xFF233645),),),
                      Text(""+firstName+" "+lastname.toString(),style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],
              ),

              Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.5,),

              SizedBox(height: 10.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Icon(Icons.email,size: 20.0,color:Color(0xFF233645),),
                  SizedBox(width: 30.0,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xFF233645),),),
                      Text(""+email,style: TextStyle(color: Colors.grey),),

                    ],
                  ),

                ],
              ),

              Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.5,),

              SizedBox(height: 10.0,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person_outline,size: 20.0,color: Color(0xFF233645),),
                  SizedBox(width: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gender",style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xFF233645),),),
                      Text(""+gender,style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.grey.withOpacity(0.5),thickness: 1.5,),

              SizedBox(height: 10.0,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,size: 20.0,color: Color(0xFF233645),),
                    SizedBox(width: 30.0,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF233645),),),
                          Text(""+address+""+city+""+coordinates,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
