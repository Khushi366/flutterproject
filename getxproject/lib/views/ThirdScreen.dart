import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/controllers/PageController.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DataController c = Get.put(DataController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("DataScreen",style: TextStyle(color: Colors.white),),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: c.roll,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "RollNo",hintStyle: TextStyle(fontFamily: "Semibold"),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),

                style: TextStyle(fontFamily: "Semibold"),
              ),
              SizedBox(height: 20.0,),

              TextField(
                controller: c.name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",hintStyle: TextStyle(fontFamily: "Semibold"),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),

                style: TextStyle(fontFamily: "Semibold"),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: c.s1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "S1",hintStyle: TextStyle(fontFamily: "Semibold"),

                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
                style: TextStyle(fontFamily: "Semibold"),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: c.s2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "S2",hintStyle: TextStyle(fontFamily: "Semibold"),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),

                style: TextStyle(fontFamily: "Semibold"),
              ),
              SizedBox(height: 20.0,),

              TextField(
                controller: c.s3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "S3",hintStyle: TextStyle(fontFamily: "Semibold"),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),

                style: TextStyle(fontFamily: "Semibold"),
              ),
              SizedBox(height: 20.0,),

             ElevatedButton(onPressed: (){

               c.student();
               c.roll.clear();
               c.name.clear();
               c.s1.clear();
               c.s2.clear();
               c.s3.clear();
             }, child: Text("Submit")),
             //output
              Text("RollNo:"+c.rollNo.toString()),
              Text("Names:"+c.names.toString()),
              Text("Total:"+c.total.toString()),
              Text("Percentage:"+c.per.toString()+"%"),
              Text("Grade:"+c.gred.toString()),

            ],
          ),
        ),
      )),

    );
  }
}
