import 'package:flutter/material.dart';

import 'EditIncomeExample.dart';
import 'helper/DatabaseHelper.dart';

class IncomeExample extends StatefulWidget {
  const IncomeExample({super.key});

  @override
  State<IncomeExample> createState() => _IncomeExampleState();
}

class _IncomeExampleState extends State<IncomeExample> {
  Future<List>? alldata;
  Future<List>getData()async
  {
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.allTransactions("Income");
    return data;
  }

  @override
  void initState()
  {
    super.initState();
    setState(() {
      alldata = getData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: alldata,
                builder: (index,snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length <= 0) {
                      return Center(
                        child: Text("No task found!"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            //height: 200,
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(""+snapshot.data![index]["title"].toString(),
                                      style: TextStyle(color: Colors.white),),
                                    Text(
                                      "Rs."+snapshot.data![index]["amt"].toString(),
                                      style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ""+snapshot.data![index]["remark"].toString(),
                                      style: TextStyle(color: Colors
                                          .white),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap:()async
                                            {
                                              var tid = snapshot.data![index]["tid"].toString();
                                              DatabaseHelper obj = new DatabaseHelper();
                                              var status = await obj.deleteTransaction(tid);
                                              if(status == 1)
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text("deleted"))
                                                );

                                                setState(() {
                                                  alldata = getData();
                                                });
                                              }
                                              else
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text("not deleted"))
                                                );
                                              }


                                            },
                                            child: Icon(Icons.delete, color: Colors.white,)),
                                        GestureDetector(
                                            onTap:(){
                                              var tid = snapshot.data![index]["tid"].toString();

                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditIncomeExample(updatetid: tid,)));
                                            },
                                            child: Icon(Icons.edit, color: Colors.white,)),
                                      ],
                                    ),
                                    Text(""+snapshot.data![index]["dates"].toString(),
                                      style: TextStyle(color: Colors.white),),
                                  ],
                                ),

                              ],
                            ),
                          );
                        }
                    );
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            ),
          ),
        ],
      ),


    );
  }
}
