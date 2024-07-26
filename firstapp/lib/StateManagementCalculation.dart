import 'package:flutter/material.dart';

class StateManagementCalculation extends StatefulWidget {
  const StateManagementCalculation({super.key});

  @override
  State<StateManagementCalculation> createState() => _StateManagementCalculationState();
}

class _StateManagementCalculationState extends State<StateManagementCalculation> {

  var result = "0";

  TextEditingController _no1 = TextEditingController();
  TextEditingController _no2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _no1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Number 1",
              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _no2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Number 2",
              ),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                IconButton(
                    onPressed: (){
                      setState(() {
                        result = (int.parse(_no1.text) + int.parse(_no2.text)).toString();
                      });

                  }, icon: Icon(Icons.add_circle)
                ),


                IconButton(
                    onPressed: (){
                      setState(() {

                        result = (int.parse(_no1.text) - int.parse(_no2.text)).toString();

                      });
                    }, icon: Icon(Icons.minimize)
                ),

                IconButton(
                    onPressed: (){
                    setState(() {

                      result = (int.parse(_no1.text) * int.parse(_no2.text)).toString();

                    });
                    }, icon: Icon(Icons.close)
                ),

                IconButton(
                    onPressed: (){
                    setState(() {

                      result =( int.parse(_no1.text) / int.parse(_no2.text)).toString();

                    });

                      }, icon: Icon(Icons.all_inclusive)

                ),
                Text("Result : "+ result.toString()),



              ],
            ),


          ],
        ),
      ),
    );
  }
}
