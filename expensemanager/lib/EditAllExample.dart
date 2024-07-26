import 'package:expensemanager/AllExample.dart';
import 'package:expensemanager/HomePageExample.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'helper/DatabaseHelper.dart';

class EditAllExample extends StatefulWidget {

  var updatetid = "";

   EditAllExample({required this.updatetid});

  @override
  State<EditAllExample> createState() => _EditAllExampleState();
}

class _EditAllExampleState extends State<EditAllExample> {
  @override
  TextEditingController _title = TextEditingController();
  TextEditingController _remark = TextEditingController();
  TextEditingController _amt = TextEditingController();
  TextEditingController _date = TextEditingController();

  var type = "Income";

  _handelRadio(val){
    setState(() {
      type = val!;
    });
  }

   getdata()async
   {
     DatabaseHelper obj = new DatabaseHelper();
     var data = await obj.getSingleExpense(widget.updatetid);

     setState(() {
         type = data[0]["types"].toString();
       _title.text = data[0]["title"].toString();
       _remark.text = data[0]["remark"].toString();
       _amt.text = data[0]["amt"].toString();
       _date.text = data[0]["dates"].toString();
     });

   }

  @override
  void initState()
  {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,size: 20.0,)),
                  Expanded(child: Center(child: Text("All",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.0),))),
                ],
              ),
              SizedBox(height: 15.0,),

              Row(
                children: [
                  Text("Type"),
                  Radio(value: "Income", groupValue: type, onChanged:_handelRadio),
                  Text("Income"),

                  Radio(value: "Expense", groupValue: type, onChanged:_handelRadio),
                  Text("Expense"),
                ],
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: _title,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Title",
                ),
              ),

              SizedBox(height: 15.0,),
              TextField(
                controller: _remark,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Remark",
                ),
              ),
              SizedBox(height: 15.0,),
              TextField(
                controller: _amt,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Amount",
                ),
              ),

              SizedBox(height: 15.0,),
              TextField(
                  controller: _date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: "Date",
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:DateTime(2000),
                        lastDate: DateTime(2101)
                    );
                    if(pickedDate != null ){
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(() {
                        _date.text = formattedDate;
                      });
                    }
                  }
              ),
              SizedBox(height: 15.0,),
              ElevatedButton(
                  onPressed: () async
                  {
                    var title  = _title.text.toString();
                    var remark  = _remark.text.toString();
                    var amt  = _amt.text.toString();
                    var types = type;
                    var dates = _date.text.toString();

                    DatabaseHelper obj = new DatabaseHelper();
                    var status = await obj.updateTransactions(types, title, remark, amt, dates,widget.updatetid);

                    if(status==1)
                    {
                      Navigator.of(context).pop();//edit
                      Navigator.of(context).pop();//view
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> HomePageExample(initialTabIndex: 0,))
                      );
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error!"))
                      );
                    }

                  }, child: Text("Edit")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
