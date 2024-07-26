import 'package:flutter/material.dart';

class EmployeeStateManagement extends StatefulWidget {
  const EmployeeStateManagement({super.key});

  @override
  State<EmployeeStateManagement> createState() => _EmployeeStateManagementState();
}

class _EmployeeStateManagementState extends State<EmployeeStateManagement> {

  var name = "";
  var salary = 0;
  var present = 0;
  var totalDay = 0;
  var netSalary = 0.0;


  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _presen = TextEditingController();
  TextEditingController _total = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Salary"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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

              SizedBox(height: 20,),
              TextField(
                controller: _presen,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Present Day",
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: _total,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Total Day",
                ),
              ),

              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

               setState(() {

                 name = _name.text.toString();
                 salary = (int.parse(_salary.text.toString()));
                 present = (int.parse(_presen.text.toString()));
                 totalDay = (int.parse(_total.text.toString()));

                 netSalary = (salary) * (present) / double.parse(totalDay.toString());


               });
                }, child: Text("Submit"),
              ),
              SizedBox(
                height: 150,
                width: 250.0,
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name : "+name,style: TextStyle(color:Colors.white,wordSpacing: 5.0,fontSize: 18.0,)),

                        Text("Salary : "+salary.toString(),style: TextStyle(color:Colors.white,wordSpacing: 5.0,fontSize: 18.0,)),
                        Text("Present : "+present.toString(),style: TextStyle(color:Colors.white,wordSpacing: 2.0,fontSize: 18.0,)),
                        Text("TotalDay : "+totalDay.toString(),style: TextStyle(color:Colors.white,wordSpacing: 5.0,fontSize: 18.0,)),

                        Text("***********************",style: TextStyle(color:Colors.white,wordSpacing: 5.0,fontSize: 18.0,)),
                        Text("NetSalary : "+"₹."+netSalary.toStringAsFixed(2),style: TextStyle(color:Colors.white,wordSpacing: 5.0,fontSize: 18.0,)),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
