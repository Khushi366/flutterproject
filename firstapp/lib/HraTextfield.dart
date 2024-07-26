import 'package:flutter/material.dart';

class HraTextfield extends StatefulWidget {
  const HraTextfield({super.key});

  @override
  State<HraTextfield> createState() => _HraTextfieldState();
}

class _HraTextfieldState extends State<HraTextfield> {

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();

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
            SizedBox(height: 20,),
            TextField(
              controller: _name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )
              ),
            ),


            SizedBox(height: 20,),
            TextField(
              controller: _salary,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Salary",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )
              ),
            ),


            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {

                var salary = double.parse(_salary.text.toString());
                var hra = 2 / 100 * salary ;
                var da = 3 /100 * salary ;
                var pf = 14 /100 * salary ;

                var total = salary + hra + da;
                var netSalary =  total - pf ;

                print(" name = " + _name.text.toString());
                print(" salary = " + _salary.text.toString());
                print("hra(2%) = " + hra.toString());
                print("da(3%) = " + da.toString());
                print("pf(14%) = " + pf.toString());

                print("NetSalary = " + netSalary.toString());
              },

              child: Text("Submit"),
            )

          ],
        ),
      ),
    );
  }
}
