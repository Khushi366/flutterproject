import 'dart:developer';

import 'package:flutter/material.dart';

class HraStateManagement extends StatefulWidget {
  const HraStateManagement({super.key});

  @override
  State<HraStateManagement> createState() => _HraStateManagementState();
}

class _HraStateManagementState extends State<HraStateManagement> {

  var salary = 0;
  var hra = "0";
  var da = "0";
  var pf = "0";
  var name = "";
  var netProf= 0.0;
  var total;

  TextEditingController _name  = TextEditingController();
  TextEditingController _salary  = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Hra"),
    ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [

            TextField(
              controller: _name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Name",
              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _salary,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Salary",
              ),
            ),

            ElevatedButton(
                onPressed: (){

                  setState(() {
                    name = _name.text.toString();
                    salary = (int.parse(_salary.text.toString()));

                    hra = (2/100 * salary).toString();
                    da =  (3/100 * salary).toString();
                    pf =  (14/100 * salary).toStringAsFixed(2);

                    total = (salary) + double.parse(hra.toString()) + double.parse(da.toString());
                    netProf = (total) - double.parse(pf.toString());
                    log("NetProfit + $netProf");


                  });

              }, child: Text("Submit"),
            ),
            Text("Name : "+ name),
            Text("+Salary : "+ salary.toString()),
            Text("+HRA(2%) : "+ hra.toString()),
            Text("+Da(3%) : "+ da.toString()),
            Text("-pf(14%) : "+ pf.toString()),

            Text("***********************************"),
            Text("NetProfit : "+netProf.toString()),

          ],
        ),
      ),
    );
  }
}
