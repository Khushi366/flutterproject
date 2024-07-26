import 'package:flutter/material.dart';
import 'package:propsmart/helper/ApiHandler.dart';
import 'package:propsmart/helper/ErrorHandler.dart';
import 'package:propsmart/providers/EmployeeProvider.dart';
import 'package:propsmart/resources/UrlResources.dart';
import 'package:propsmart/widgets/MyTextBox.dart';
import 'package:propsmart/widgets/PrimaryButton.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  EmployeeProvider? provider;
  var gender="Male";
  var department = "";

  TextEditingController _empsalary = TextEditingController();
  TextEditingController _empname = TextEditingController();
  _handleRadio(val)
  {
    setState(() {
      gender=val!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Add Employess",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0),),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextBox(
              hinttext: "Name",
              keywordType: TextInputType.name,
              controller: _empname,
            ),
            SizedBox(height: 20.0,),
            MyTextBox(
              hinttext: "Salary",
              keywordType: TextInputType.number,
              controller: _empsalary,
            ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                DropdownButton(
                    value: department,
                    items: [
                      DropdownMenuItem(child: Text("Select Department"), value: ""),
                      DropdownMenuItem(child: Text("Gujarat"),value: "Gujarat",),
                      DropdownMenuItem(child: Text("Maharstra"),value: "Maharstra",),
                      DropdownMenuItem(child: Text("Punjab"),value: "Punjab",),
                    ],
                    onChanged: (val){
                      setState(() {
                        department=val!;

                      });

                    }
                ),
              ],
            ),
            SizedBox(height: 20.0,),

            Row(
              children: [
                Text("Male"),
                Radio(
                    value: "Male",
                    groupValue: gender,
                    onChanged: _handleRadio,
                ),
                Text("Female"),
                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: _handleRadio,
                ),
              ],
            ),

            PrimaryButton(
              btntext: "Add",
              btncolor:Color(0xFF294357),
              onclick: ()async {
                var name = _empname.text.toString();
                var salary = _empsalary.text.toString();

                if (name.isEmpty || salary.isEmpty || department.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("All fields are required."),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                var params = {
                  "ename": name,
                  "salary": salary,
                  "department": department,
                  "gender": gender
                };
                await provider!.insertEmployee(context,params);
                if(provider!.isInsert == true)
                {

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(provider!.insertMessage),
                        backgroundColor: Colors.green,)
                  );

                }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(provider!.insertMessage),
                          backgroundColor: Colors.green,)
                    );

                  }
              })



          ],
        ),
      ),
    );
  }
}
