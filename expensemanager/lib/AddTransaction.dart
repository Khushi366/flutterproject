import 'package:expensemanager/HomePageExample.dart';
import 'package:expensemanager/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {

  var mytype="";
  AddTransaction({required this.mytype});


  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
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



  @override
  void initState()
  {
    super.initState();
    setState(() {
      type=widget.mytype;
    });
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
                  Expanded(child: Center(child: Text("Add Transaction",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.0),))),
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
                  var id = await obj.insertTransaction(types,title, remark, double.parse(amt),dates);

                  if(id>=1)
                    {

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Transaction Inserted : " + id.toString()))
                      );
                      _title.text = "";
                      _remark.text = "";
                      _amt.text = "";
                      _date.text = "";
                      setState(() {
                        type = "Income";
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageExample()));
                    }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error!"))
                    );
                  }
                }, child: Text("Add")
              ),
            ],
          ),
        ),
      ),

    );
  }
}
