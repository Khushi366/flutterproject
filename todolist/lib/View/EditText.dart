import 'package:flutter/material.dart';
import 'package:todolist/Helper/DatabaseHelper.dart';
import 'package:todolist/Theme/AppColor.dart';
import 'package:todolist/Utility/HomePage.dart';
import 'package:todolist/Widget/MyTextBox.dart';
import 'package:todolist/Widget/PrimaryButton.dart';

class EditText extends StatefulWidget {
  // ID of the task to be updated
  var updattid = "";
  EditText({required this.updattid});// Constructor that requires the task ID

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  // Controllers for the title and remark fields
  TextEditingController _title = TextEditingController();
  TextEditingController _remask = TextEditingController();

  // Method to fetch existing data for the task to be edited
  getdata() async
  {
    DatabaseHelper obj = new DatabaseHelper();// Create an instance of DatabaseHelper
    var data = await obj.getSingleTask(widget.updattid);// Fetch the task data using the ID
    setState(() {
      // Set the fetched data to the controllers
      _title.text = data[0]["title"].toString();
      _remask.text = data[0]["remark"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();// Fetch the task data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Expanded(child: Center(child: Text("Edit Task",style: TextStyle(color: kBlack,fontWeight: FontWeight.bold,fontSize: 14.0),))),
                  ],
                ),
                SizedBox(height: 20.0,),
                // Text field for task title
                CustomTextField(
                  controller: _title,
                  keyboardType: TextInputType.text,
                  hintText: "Title",
                  focusedBorderColor: kButtonColor
                ),

                SizedBox(height: 15.0,),
                // Text field for task remark
                CustomTextField(
                    controller: _remask,
                    keyboardType: TextInputType.text,
                    hintText: "Remark",
                    maxLines: 5,// Allow multiple lines for remarks
                    focusedBorderColor: kButtonColor
                ),

                SizedBox(height: 15.0,),
                // Button to update the task
                CustomButton(
                  onPressed: () async {
                    var title = _title.text.toString();// Get the updated title
                    var remark = _remask.text.toString();// Get the updated remark
                    DatabaseHelper obj = new DatabaseHelper();// Create an instance of DatabaseHelper
                    // Update the task in the database
                    var status = await obj.updateTask(title,remark,widget.updattid);
                    if(status==1)
                    {
                      // Navigate back to the previous screens after a successful update
                      Navigator.of(context).pop();//// Close the edit screen
                      Navigator.of(context).pop();//Close the task view screen
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>HomePage())
                      );// Navigate to the HomePage
                    }
                    else
                    {
                      // Show an error message if the update failed
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error!"))
                      );
                    }
                  }, buttonText: 'Edit'// Text on the button
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
