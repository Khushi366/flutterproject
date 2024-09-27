import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Theme/AppColor.dart';
import 'package:todolist/View/AddTask.dart';
import 'package:todolist/Helper/DatabaseHelper.dart';
import 'package:todolist/View/EditText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Method to handle popup menu selections (delete or edit a task)
  void _handelPopupMenuSelection(int value, String tid) async
  {
    switch(value){
      case 1:// Delete task
        DatabaseHelper obj = new DatabaseHelper();
        var status = await obj.deleteTask(tid);
        if(status==1)
        {
          // Show success message if task is deleted
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Task deleted"))
          );
          setState(() {
            alldata = getdata();// Refresh task list
          });
        }
        else
        {
          // Show error message if task is not deleted
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Task not deleted"))
          );
        }
        break;
      case 2:// Edit task
       Navigator.push(context, MaterialPageRoute(builder: (context) => EditText(updattid: tid)));
        break;
    }
  }

  Future<List>? alldata;// Future to hold all task data
  // Method to fetch all tasks from the database
  Future<List> getdata()async{
    DatabaseHelper obj = new DatabaseHelper();
    var data = await obj.allTask();
    return data;// Return the fetched data
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      alldata = getdata();// Initialize the task list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/banner.png",width: 150.0,),
                ],
              ),
              SizedBox(height: 10.0,),
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
                        else {
                          // Build the list of tasks
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                bool isCompleted = snapshot.data![index]["completed"] == 1;
                                return Container(
                                  margin: EdgeInsets.all(6.0),
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          // Display task title with conditional strike-through
                                          Text(
                                            snapshot.data![index]["title"].toString(),
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              decoration: isCompleted
                                                  ? TextDecoration.lineThrough
                                                  : null, // Line-through if completed
                                            ),
                                          ),
                                          // Checkbox to mark task as completed
                                          Checkbox(
                                            value: isCompleted,
                                            activeColor: kButtonColor,
                                            onChanged: (bool? value) async {
                                              await DatabaseHelper().updateTaskCompletion(
                                                  snapshot.data![index]["tid"], value!);
                                              setState(() {
                                                alldata = getdata();
                                              });
                                            },
                                          ),
                                          Spacer(),
                                          // Popup menu for task options (delete/edit)
                                          PopupMenuButton(
                                            itemBuilder: (BuildContext contex) {
                                              return [
                                                PopupMenuItem(
                                                  child: Text("Delete"),
                                                  value: 1,
                                                ),
                                                PopupMenuItem(
                                                  child: Text("Edit"),
                                                  value: 2,
                                                )
                                              ];
                                            },
                                            onSelected: (int value) {
                                              _handelPopupMenuSelection(value, snapshot.data![index]["tid"].toString());
                                            },
                                          )
                                        ],
                                      ),
                                      // Display task remark with conditional strike-through
                                      Text(""+snapshot.data![index]["remark"].toString(),textAlign: TextAlign.justify,style: TextStyle(fontSize: 14.0, decoration: isCompleted
                                          ? TextDecoration.lineThrough : null, ),),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kGeryColor.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(2, 2),
                                        ),
                                        BoxShadow(
                                          color: kGeryColor.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(-2, -2),
                                        ),
                                      ]
                                  ),
                                );
                              }
                          );
                        }
                      }
                      else
                      {
                        // Show loading indicator while data is being fetched
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                ),
              )
            ],
          ),
        ),
        // Floating action button to add a new task
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddTask()));
            },
            child: Icon(Icons.add,color: kWhite,size: 25,),
            backgroundColor: kButtonColor
        ),
      ),
    );
  }
}
