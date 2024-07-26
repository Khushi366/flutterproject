import 'package:flutter/material.dart';

class RemainStateManagement extends StatefulWidget {
  const RemainStateManagement({super.key});

  @override
  State<RemainStateManagement> createState() => _RemainStateManagementState();
}

class _RemainStateManagementState extends State<RemainStateManagement> {

  var totalComplaints = "0";
  var complaints = "0";
  var remainComplaintsSubtract = "0";
  var remainComplaints =0.0;

  TextEditingController _com1 = TextEditingController();
  TextEditingController _com2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remain Complaints"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _com1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Total Complain",
              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _com2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Complain",
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    totalComplaints = _com1.text.toString();
                    complaints =  _com2.text.toString();
                    remainComplaintsSubtract = (int.parse(totalComplaints) - int.parse(complaints)).toString();
                    remainComplaints = (double.parse(remainComplaintsSubtract) / double.parse(totalComplaints) * 100);


                  });
              }, child: Text("Submit"),
            ),
            Text("Remain Complaints : "+remainComplaints.toStringAsFixed(0)+"%")

          ],
        ),
      ),
    );
  }
}
