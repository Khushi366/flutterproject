import 'package:api/Login.dart';
import 'package:api/LoginExample.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var name="";

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name").toString();
    });

    

    Uri url = Uri.parse("https://api.viosa.in/user/aptitude/getMyPaperResults");
    var header = {
     "token":prefs.getString("token").toString()
      //'Authorization': 'Bearer '+prefs.getString("token").toString(),
    };
    // var params = {
    //   "token":prefs.getString("token").toString()
    // };
    var response = await http.get(url,headers: header);
    if(response.statusCode==200)
      {
        //
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("API call and data is displayed"))
        );
      }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Token is expired. Please login again"))
        );
        prefs.clear();
        Navigator.of(context).pop();
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
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
        backgroundColor: Colors.red,
       actions: [
         GestureDetector(
             onTap: ()async{
               SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.clear();
               Navigator.of(context).pop();
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));

             },
             child: Icon(Icons.logout_outlined,color: Colors.white,)),

       ],
        title: Text("Welcome,"+name,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
