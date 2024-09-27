import 'package:flutter/material.dart';
import 'package:todolist/Theme/AppColor.dart';
import 'package:todolist/Utility/HomePage.dart';
import 'package:todolist/Widget/MyTextBox.dart';
import 'package:todolist/Widget/PrimaryButton.dart';
import '../helper/DatabaseHelper.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // Controllers for text fields
  TextEditingController _title = TextEditingController();
  TextEditingController _remask = TextEditingController();

  // Method to validate inputs and show SnackBar messages
  void _validateInputs() {
    if (_title.text.isEmpty) {
      // Show SnackBar for empty title
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a title")),
      );
    } else if (_remask.text.isEmpty) {
      // Show SnackBar for empty remark
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a remark")),
      );
    } else {
      // If both fields are valid, proceed to add the task
      _addTask();
    }
  }

  // Method to add the task to the database
  Future<void> _addTask() async {
    var title = _title.text.toString(); // Get the title text
    var remark = _remask.text.toString(); // Get the remark text
    DatabaseHelper obj = new DatabaseHelper(); // Create an instance of DatabaseHelper

    // Insert the task into the database
    var id = await obj.insertTask(title, remark);
    if (id >= 1) {
      // Show a success message if the task was inserted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Task Inserted: " + id.toString())),
      );
      // Clear the text fields
      _title.clear();
      _remask.clear();
    } else {
      // Show an error message if the insertion failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error inserting task!")),
      );
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
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
                SizedBox(height: 20.0),
                Row(
                  children: [
                    // Back button to navigate to the previous screen
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined, size: 20.0),
                    ),
                    // Title of the screen
                    Expanded(
                      child: Center(
                        child: Text(
                          "New Task",
                          style: TextStyle(color: kBlack, fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                // Text field for task title
                CustomTextField(
                  controller: _title,
                  keyboardType: TextInputType.text,
                  hintText: "Title",
                  focusedBorderColor: kButtonColor
                ),
                SizedBox(height: 15.0),
                // Text field for task remark
                CustomTextField(
                  controller: _remask,
                  keyboardType: TextInputType.text,
                  hintText: "Remark",
                  maxLines: 5,// Allow multiple lines for remarks
                  focusedBorderColor: kButtonColor
                ),
                SizedBox(height: 15.0),
                // Button to add the task
                CustomButton(
                  onPressed: _validateInputs, // Validate inputs when the button is pressed
                  buttonText: "Add", // Text on the button
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
