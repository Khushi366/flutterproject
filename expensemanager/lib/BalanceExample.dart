import 'dart:developer';

import 'package:expensemanager/AllExample.dart';
import 'package:expensemanager/HomePageExample.dart';
import 'package:expensemanager/IncomeExample.dart';
import 'package:expensemanager/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class BalanceExample extends StatefulWidget {
  const BalanceExample({super.key});

  @override
  State<BalanceExample> createState() => _BalanceExampleState();
}

class _BalanceExampleState extends State<BalanceExample> {


  var totalincome=0.0;
  var totalexpense=0.0;

  getdata() async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.allTransactions("all");
    data.forEach((row) {
      if(row["types"]=="Income")
        {
          setState(() {
            totalincome = totalincome + double.parse(row["amt"].toString());
          });
        }
      else
        {
          setState(() {
            totalexpense = totalexpense + double.parse(row["amt"].toString());
          });
        }
    });
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
     // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
                Expanded(child: Center(child: Text("Spend",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
              ],
            ),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageExample(initialTabIndex: 0,)));
              },
              child: Container(
                width: double.infinity,
                height: 110,
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFC0C0C0).withOpacity(0.4),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: Offset(0.5, 0.5),
                    ),
                    BoxShadow(
                      color: Color(0xFFC0C0C0).withOpacity(0.4),
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      offset: Offset(-0.5, -0.5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.trending_up,color: Colors.blue,),
                    Text("Total Balance",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("Rs."+(totalincome-totalexpense).toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFC0C0C0)),),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12.0,),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageExample(initialTabIndex: 2,)));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.attach_money,color: Colors.green,size: 22.0,),
                          Text("Income",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("Rs."+totalincome.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFC0C0C0)),),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.0,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePageExample(initialTabIndex: 1,)));

                    },
                    child: Container(
                      width: double.infinity,
                      height: 110,
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                          BoxShadow(
                            color: Color(0xFFC0C0C0).withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(-0.5, -0.5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.payment,color: Colors.red,size: 20.0,),
                          Text("Expense",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("Rs."+totalexpense.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFC0C0C0)),),

                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
