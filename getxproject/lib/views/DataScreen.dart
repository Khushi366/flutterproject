import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/PageController.dart';
import 'MyDrawer.dart';


class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {

    DataController c = Get.put(DataController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("DataScreen",style: TextStyle(color: Colors.white),),
      ),
      drawer: MyDrawer(),
      body: Obx(() => Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: c.num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number 1",hintStyle: TextStyle(fontFamily: "Semibold"),

                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
              style: TextStyle(fontFamily: "Semibold"),
            ),
            SizedBox(height: 20.0,),
            TextField(
              controller: c.num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number 2",hintStyle: TextStyle(fontFamily: "Semibold"),
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),

              style: TextStyle(fontFamily: "Semibold"),
            ),
            SizedBox(height: 20.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: (){

                      c.add();
                    },
                    child: Text('+', style: TextStyle(fontSize: 50),)),
                GestureDetector(
                  onTap: (){

                    c.sub();
                  },child: Text('-', style: TextStyle(fontSize: 50),)),
                GestureDetector(
                    onTap: (){

                      c.mul();
                    },child: Text('x', style: TextStyle(fontSize: 50),)),
                GestureDetector(
                  onTap: (){

                    c.div();
                  },
                  child: Text('÷', style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),

            Text(c.total.toString())
          ],
        ),
      )),
    );
  }
}

